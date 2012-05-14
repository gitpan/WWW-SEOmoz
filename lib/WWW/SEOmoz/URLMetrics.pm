# ABSTRACT: Class to represent the URL metrics returned from the SEOmoz API.
package WWW::SEOmoz::URLMetrics;

use Moose;
use namespace::autoclean;

use Carp qw( croak );

our $VERSION = '0.02'; # VERSION


has 'title' => (
    isa      => 'Str',
    is       => 'ro',
    required => 1,
);


has 'url' => (
    isa      => 'Str',
    is       => 'ro',
    required => 1,
);


has 'external_links' => (
    isa      => 'Num',
    is       => 'ro',
    required => 1,
);


has 'links' => (
    isa      => 'Num',
    is       => 'ro',
    required => 1,
);


has 'mozrank' => (
    isa      => 'Num',
    is       => 'ro',
    required => 1,
);


has 'mozrank_raw' => (
    isa      => 'Num',
    is       => 'ro',
    required => 1,
);


has 'subdomain_mozrank' => (
    isa      => 'Num',
    is       => 'ro',
    required => 1,
);


has 'subdomain_mozrank_raw' => (
    isa      => 'Num',
    is       => 'ro',
    required => 1,
);


has 'http_status_code' => (
    isa      => 'Int',
    is       => 'ro',
    required => 1,
);


has 'page_authority' => (
    isa      => 'Num',
    is       => 'ro',
    required => 1,
);


has 'domain_authority' => (
    isa      => 'Num',
    is       => 'ro',
    required => 1,
);

__PACKAGE__->meta->make_immutable;


sub new_from_data {
    my $class = shift;
    my $data  = shift || croak 'Requires a hash ref of data returned from the API';

    return $class->new({
        title                   => $data->{ut},
        url                     => $data->{uu},
        external_links          => $data->{ueid},
        links                   => $data->{uid},
        mozrank_raw             => $data->{umrr},
        mozrank                 => $data->{umrp},
        subdomain_mozrank       => $data->{fmrp},
        subdomain_mozrank_raw   => $data->{fmrr},
        http_status_code        => $data->{us},
        page_authority          => $data->{upa},
        domain_authority        => $data->{pda},
    });
}


1;

__END__
=pod

=head1 NAME

WWW::SEOmoz::URLMetrics - Class to represent the URL metrics returned from the SEOmoz API.

=head1 VERSION

version 0.02

=head1 DESCRIPTION

Class to represent the URL metrics data returned from the 'url-metrics' method
in the SEOmoz API.

=head1 ATTRIBUTES

=head2 title

=head2 url

=head2 external_links

=head2 links

=head2 mozrank

=head2 mozrank_raw

=head2 subdomain_mozrank

=head2 subdomain_mozrank_raw

=head2 http_status_code

=head2 page_authority

=head2 domain_authority

=head1 METHODS

=head2 new_from_data

    my $metrics = WWW::SEOmoz::URLMetrics->( $data );

Returns a new L<WWW::SEOmoz::URLMetrics> object from the data returned from the API
call.

=head1 SEE ALSO

L<WWW::SEOmoz>

=head1 AUTHOR

Adam Taylor <ajct@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Adam Taylor.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

