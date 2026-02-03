Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CC9E8B362
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Feb 2026 20:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qrlYOcJaJUiQD7fKhTWFMTN62nj5QxdjMsvcnAl7S14=; b=FNMjKKu6K3pZ/P
	m7C+kHyKyePjniy8HQrhyc7N1BWrfVIDVw1IIuS6eSH98zH2KXQKt2dY3BtJi+UeNzkRrXbB/X2+X
	AdePlsj08YjBEYNxVPfdPN7QP58TX5J8urQrOgPaW1p7W8LzbYsA2Sqt01NvOtmXXKLEqwJJV38+3
	663sN/+w+qTNl96X6CIgB6kplQ07ajLz+e827JkjGU/K9W7ttVdsqA5TC/IsWwSAcGF7zSD8JDIik
	HQg1Y+4XEx4vl3wfcsot51Ps3VyqiPRHdOosj4KuSRgyhjS6vHFnoMPBcHmV8Nd66bBTwfljB1yVv
	99pHMNoA28PggoYgSsiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnMtO-00000007JHY-3WuC;
	Tue, 03 Feb 2026 20:20:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnMtM-00000007JGd-06ch
	for linux-i3c@lists.infradead.org;
	Tue, 03 Feb 2026 20:20:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B47D442E53
	for <linux-i3c@lists.infradead.org>; Tue,  3 Feb 2026 20:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C83C2BCAF
	for <linux-i3c@lists.infradead.org>; Tue,  3 Feb 2026 20:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770150054;
	bh=uRdo9T/JxdN5Vvo7QBrwNhie6atlsh3Wku65n0I6LWM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MHIYu1qjcDf2C0nqjowuyKGYQF2Suv8A7QJtOeA2HWRzO94wHHo3w0xMSSIFC7Tyn
	 vYDbIbfQtnNVq+kfWjuSMBPvGDjmtNugqeA9v/XZTkS5Olv16IsSLCGr3iHPvkkmqE
	 F1lwyca6Rn8OCKLCJG+HB+1Z5TBS9g3MujuK/lvowSS3rOqIx3G9Q2EKvjMN/7WjWQ
	 eIDXQIjRLClh5rtEOZmCjyUKHe/5ITVCYN1IlzZw9203ENxSRSLTOAuJAGu1PRGkQx
	 DDZAiqpnucFxZO38p+kff31cVzOJ+zVQm3DVdFpeciglcssJb9cyy0/VtkNo+MJ0ja
	 BCnmS4+DkR8GA==
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-40946982a78so2032766fac.2
        for <linux-i3c@lists.infradead.org>; Tue, 03 Feb 2026 12:20:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWMAChfkjnbg3CiW72k5/JTzB+8XVqVRfb+6Ro7vYKIVntPCQj4MuR35N1UurjN2nTL4scTI9AhJa0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx82g+lGvThx63pQyBFgXjlsYrdPjAn1OcDC7hnwk+9U1G0p8ix
	qPHfxHyIcPtOYtxqAhsbcJX9scvPavM7fSt6B2QsVTqlW98pxSqiaTXKX+BvouFINCuRAvjy3KG
	bJAtEct0lrElJPZD9MFBK3pcPsNlgOfQ=
X-Received: by 2002:a05:6820:994:b0:662:f4cb:208f with SMTP id
 006d021491bc7-66a22690aedmr413471eaf.51.1770150053603; Tue, 03 Feb 2026
 12:20:53 -0800 (PST)
MIME-Version: 1.0
References: <20260129181841.130864-1-adrian.hunter@intel.com>
 <20260129181841.130864-6-adrian.hunter@intel.com> <aXu8TiFpMiIVk5Iq@lizhi-Precision-Tower-5810>
 <dd681a97-de37-436b-b09e-5173c1de2f24@intel.com> <aXvKZK8tTnCDGzth@lizhi-Precision-Tower-5810>
 <a8a608c8-c6ce-415b-ac02-db1246edb15e@intel.com> <aXzIeLLDxsmzUhI+@lizhi-Precision-Tower-5810>
 <09622627-2ff3-4fb7-80f2-686d6474e417@intel.com> <aYDP847mgleQBF5Y@lizhi-Precision-Tower-5810>
 <eb335daa-ab6b-4cff-bea2-90160892bc8f@intel.com> <aYIbZ3PwiKUfp/eL@lizhi-Precision-Tower-5810>
 <73f7fc6b-d3cc-46d0-a07b-45c2a4190434@intel.com> <a6525228-2abf-4177-acc7-858843941ba4@intel.com>
In-Reply-To: <a6525228-2abf-4177-acc7-858843941ba4@intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 3 Feb 2026 21:20:42 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0ha8VG2k42qCgWXmx96Rn9WY7x10dLEipJMj2kRFEfHmw@mail.gmail.com>
X-Gm-Features: AZwV_QgLjR1iW-ulNpU1td_J9ICfk9E7_Ru6m1VZ-sWnr4Ijfl0Ej8Z3FZ0IR8I
Message-ID: <CAJZ5v0ha8VG2k42qCgWXmx96Rn9WY7x10dLEipJMj2kRFEfHmw@mail.gmail.com>
Subject: Re: [PATCH 5/7] i3c: mipi-i3c-hci: Allow parent to manage runtime PM
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>, Frank Li <Frank.li@nxp.com>, 
	alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_122056_124328_CCD362CA 
X-CRM114-Status: GOOD (  26.00  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBGZWIgMywgMjAyNiBhdCA1OjU34oCvUE0gQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1
bnRlckBpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gMDMvMDIvMjAyNiAxODoyMiwgV3lzb2NraSwg
UmFmYWVsIEogd3JvdGU6Cj4gPgo+ID4gT24gMi8zLzIwMjYgNDo1OSBQTSwgRnJhbmsgTGkgd3Jv
dGU6Cj4gPj4gT24gVHVlLCBGZWIgMDMsIDIwMjYgYXQgMDI6NTQ6NDRQTSArMDIwMCwgQWRyaWFu
IEh1bnRlciB3cm90ZToKPiA+Pj4gKyBSYWZhZWwKPiA+Pj4KPiA+Pj4gUmFmYWVsLCB0aGlzIGlz
IG5vdCBhdCBhbGwgdXJnZW50LCBidXQgd2hlbiB5b3UgaGF2ZSB0aW1lCj4gPj4+IHBsZWFzZSBo
YXZlIGEgbG9vayBhdCB0aGlzIHBhdGNoIHNldC4gIFRoZXJlIGlzIGFsc28gc29tZQo+ID4+PiBt
b3JlIGV4cGxhbmF0aW9uIGJlbG93LiAgSXMgaXQgYWNjZXB0YWJsZT8gIElzIHRoZXJlIGEKPiA+
Pj4gYmV0dGVyIHdheT8KPiA+Pj4KPiA+Pj4gT24gMDIvMDIvMjAyNiAxODoyNSwgRnJhbmsgTGkg
d3JvdGU6Cj4gPj4+PiBEb2VzIHlvdXIgZGV2aWNlIEhpZXJhcmNoeSBsb29rIGxpa2UKPiA+Pj4+
Cj4gPj4+PiAgICAgICAgICAgICBQQ0kgZGV2aWNlCj4gPj4+PiAgICAgICAgICAgICAgICAgfAo+
ID4+Pj4gICAgICAgICAtLS0tLS0tLS0tLS0tLS0tLQo+ID4+Pj4gICAgICAgIEhDSTEgICAgICAg
ICAgICBIQ0kyCj4gPj4+PiAgICAgICAgIHwgICAgICAgICAgICAgICB8Cj4gPj4+PiAgICAgICBJ
M0MgTTEgICAgICAgICAgSTNDIE0yCj4gPj4+IFllcyBhbmQgbm8uICBUaGVyZSBpcyBvbmx5IDEg
cmVhbCBkZXZpY2UgOiB0aGUgUENJIGRldmljZS4KPiA+Pj4gSXQgaW1wbGVtZW50cyB0aGUgTUlQ
SSBJM0MgSENJIHN0YW5kYXJkIHdoaWNoIGFsbG93cyBtdWx0aXBsZQo+ID4+PiBJM0MgYnVzIGNv
bnRyb2xsZXJzIGluIG9uZSBkZXZpY2UgKGluIG91ciBjYXNlIDIgY29udHJvbGxlcnMpLgo+ID4+
Pgo+ID4+PiBUaGUgUENJIGRyaXZlciBtaXBpLWkzYy1oY2ktcGNpIGNyZWF0ZXMgMiBwbGF0Zm9y
bSBkZXZpY2VzLAo+ID4+PiBvbmUgZm9yIGVhY2ggY29udHJvbGxlci4gIFRoZSBwbGF0Zm9ybSBk
cml2ZXIgaXMgbWlwaS1pM2MtaGNpOgo+ID4+Pgo+ID4+PiAgIERyaXZlciAgICAgICAgICAgICAg
ICAgICAgICAgIERldmljZSAgICAgICAgICAgICAgICAgICAgIEJ1cwo+ID4+Pgo+ID4+PiAgIG1p
cGktaTNjLWhjaS1wY2kgICAgICAgICAgICAwMDAwOjAwOjExLjEgICAgICAgICAgICAgICAgIFBD
SQo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8gICAgICAgICAgICBcCj4gPj4+
ICAgbWlwaS1pM2MtaGNpICAgICAgaW50ZWwtbHBzcy1pM2MuMCAgaW50ZWwtbHBzcy1pM2MuMSAg
ICAgUGxhdGZvcm0KPiA+Pj4KPiA+Pj4gTFBTUyBJM0MgYWxzbyBzdXBwb3J0cyB3YWtlLXVwIGZy
b20gaW4tYmFuZCBpbnRlcnJ1cHQgKElCSSkgdmlhCj4gPj4+IFBDSSBQTUUuICBUaGUgUE1FIG9u
bHkgd29ya3Mgd2hlbiB0aGUgUENJIGRldmljZSBpcyBpbiBhIGxvdyBwb3dlcgo+ID4+PiBzdGF0
ZSAoRDNob3QgaW4gb3VyIGNhc2UpLiAgQWxzbyB0aGUgUE1FIGlzIGVmZmVjdGl2ZWx5IHNoYXJl
ZCBieQo+ID4+PiB0aGUgMiBjb250cm9sbGVycyBpLmUuIGFuIElCSSBzaWduYWwgKHRoZSBjb250
cm9sbGVyJ3MgU0RBIGxpbmUKPiA+Pj4gcHVsbGVkIGxvdykgZm9yIGVpdGhlciBjb250cm9sbGVy
IHdpbGwgY2F1c2UgdGhlIFBNRS4KPiA+Pj4KPiA+Pj4gVGhhdCBtZWFucyB0aGVyZSBhcmUgb25s
eSAyIHZhbGlkIGNvbmZpZ3VyYXRpb25zOgo+ID4+Pgo+ID4+PiAgICAgMTogQm90aCBjb250cm9s
bGVycyBlbmFibGVkIHRvIHJlY2VpdmUgSUJJcwo+ID4+PiAgICAgICAgIFBDSSBkZXZpY2UgICAg
RDAKPiA+Pj4gICAgICAgICBDb250cm9sbGVyIDEgICAgRW5hYmxlZAo+ID4+PiAgICAgICAgIENv
bnRyb2xsZXIgMiAgICBFbmFibGVkCj4gPj4+Cj4gPj4+ICAgICAyOiBCb3RoIGNvbnRyb2xsZXJz
IGRpc2FibGVkIHRvIGVuYWJsZSBQTUUgd2FrZXVwCj4gPj4+ICAgICAgICAgUENJIGRldmljZSAg
ICBEM2hvdAo+ID4+PiAgICAgICAgIENvbnRyb2xsZXIgMSAgICBEaXNhYmxlZAo+ID4+PiAgICAg
ICAgIENvbnRyb2xsZXIgMiAgICBEaXNhYmxlZAo+ID4+Pgo+ID4+PiBIb3dldmVyLCByZXByZXNl
bnRlZCBhcyBwbGF0Zm9ybSBkZXZpY2VzLCB0aGUgMiBjb250cm9sbGVycwo+ID4+PiBydW50aW1l
IHN1c3BlbmQgYW5kIHJlc3VtZSBpbmRlcGVuZGVudGx5IGZyb20gZWFjaCBvdGhlci4KPiA+Pj4g
V2hlcmVhcyB0aGV5IGVmZmVjdGl2ZWx5IG5lZWQgdG8gcnVudGltZSBzdXNwZW5kIChvciByZXN1
bWUpCj4gPj4+IGF0IHRoZSBzYW1lIHRpbWUuCj4gPj4+Cj4gPj4+IFRoZSBwcm9wb3NlZCBzb2x1
dGlvbiBpcyBmb3IgdGhlIFBDSSBkcml2ZXIgbWlwaS1pM2MtaGNpLXBjaQo+ID4+PiB0byB0YWtl
IG92ZXIgbWFuYWdpbmcgcnVudGltZSBQTSBmb3IgYm90aCBjb250cm9sbGVycywgY2FsbGluZwo+
ID4+PiBpbnRvIG1pcGktaTNjLWhjaSB3aGVuIGl0IGlzIHNhZmUgdG8gZG8gc28sIHRvIHNhdmUv
cmVzdG9yZSBzdGF0ZQo+ID4+PiBhbmQgZGlzYWJsZS9lbmFibGUgdGhlIGNvbnRyb2xsZXJzIG9u
ZSBhZnRlciB0aGUgb3RoZXIuCj4gPj4+Cj4gPj4+IEN1cnJlbnQgc2l0dWF0aW9uIChJM0MgbmV4
dCBicmFuY2gpOgo+ID4+Pgo+ID4+PiAgICAgUENJIGRldmljZSAgICBSdW50aW1lIFBNIGVuYWJs
ZWQsIGRlcGVuZGVudCBvbiBjaGlsZCBkZXZpY2VzCj4gPj4+ICAgICAgICAgICAgIFBDSSBzdWJz
eXN0ZW0gY29udHJvbHMgUENJIGRldmljZSBwb3dlciBzdGF0ZQo+ID4+Pgo+ID4+PiAgICAgQ29u
dHJvbGxlciAxICAgIFJ1bnRpbWUgUE0gZW5hYmxlZCBwbHVzIGF1dG8tc3VzcGVuZAo+ID4+PiAg
ICAgICAgICAgICBJM0Mgc3Vic3lzdGVtIHJ1bnRpbWUgUE0gZ2V0cy9wdXRzIHRoZSBQbGF0Zm9y
bSBkZXZpY2UKPiA+Pj4gICAgICAgICAgICAgUnVudGltZSBzdXNwZW5kOiBkaXNhYmxlIGFuZCBz
YXZlIHN0YXRlCj4gPj4+ICAgICAgICAgICAgIFJ1bnRpbWUgcmVzdW1lOiByZXN0b3JlIHN0YXRl
IGFuZCBlbmFibGUKPiA+Pj4KPiA+Pj4gICAgIENvbnRyb2xsZXIgMiAgICBSdW50aW1lIFBNIGVu
YWJsZWQgcGx1cyBhdXRvLXN1c3BlbmQKPiA+Pj4gICAgICAgICAgICAgSTNDIHN1YnN5c3RlbSBy
dW50aW1lIFBNIGdldHMvcHV0cyB0aGUgUGxhdGZvcm0gZGV2aWNlCj4gPj4+ICAgICAgICAgICAg
IFJ1bnRpbWUgc3VzcGVuZDogZGlzYWJsZSBhbmQgc2F2ZSBzdGF0ZQo+ID4+PiAgICAgICAgICAg
ICBSdW50aW1lIHJlc3VtZTogcmVzdG9yZSBzdGF0ZSBhbmQgZW5hYmxlCj4gPj4+Cj4gPj4+IFBy
b3Bvc2VkICh0aGlzIHBhdGNoIHNldCk6Cj4gPj4+Cj4gPj4+ICAgICBQQ0kgZGV2aWNlICAgIFJ1
bnRpbWUgUE0gZW5hYmxlZCBwbHVzIGF1dG8tc3VzcGVuZAo+ID4+PiAgICAgICAgICAgICBJM0Mg
c3Vic3lzdGVtIHJ1bnRpbWUgUE0gZ2V0cy9wdXRzIHRoZSBQQ0kgZGV2aWNlCj4gPj4+ICAgICAg
ICAgICAgIEZvciBlYWNoIGNvbnRyb2xsZXI6Cj4gPj4+ICAgICAgICAgICAgICAgICBDYWxsIGlu
dG8gbWlwaS1pM2MtaGNpICh3aGVuIGl0IGlzIHNhZmUpCj4gPj4+ICAgICAgICAgICAgICAgICAg
ICAgUnVudGltZSBzdXNwZW5kOiBkaXNhYmxlIGFuZCBzYXZlIHN0YXRlCj4gPj4+ICAgICAgICAg
ICAgICAgICAgICAgUnVudGltZSByZXN1bWU6IHJlc3RvcmUgc3RhdGUgYW5kIGVuYWJsZQo+ID4+
Pgo+ID4+PiAgICAgQ29udHJvbGxlciAxICAgIFJ1bnRpbWUgUE0gZGlzYWJsZWQKPiA+Pj4KPiA+
Pj4gICAgIENvbnRyb2xsZXIgMiAgICBSdW50aW1lIFBNIGRpc2FibGVkCj4gPj4gQ29udHJvbGxl
ciAxLzIgaXMgY2hpbGQgZGV2aWNlIG9mIFBDSSBkZXZpY2UuCj4gPj4KPiA+PiBTbyBmaXJzdCBw
YXRjaCAiaTNjOiBtYXN0ZXI6IEFsbG93IGNvbnRyb2xsZXIgZHJpdmVycyB0byBzZWxlY3QgcnVu
dGltZSBQTSBkZXZpY2UiCj4gPj4gaXMgbm90IG5lY2Vzc2FyeS4KPiA+Pgo+ID4+IFlvdSBjYW4g
ZW5hYmxlIGNvbnRyb2xsZXIgMSBhbmQgMiBSdW50aW1lIFBNIHdpdGggZHVtbXkgb3BlcmF0aW9u
Lgo+ID4+Cj4gPj4gV2hlbiBjb250cm9sbGVyIDEgcnVuIHRpbWUgc3VzcGVuZCwgcGFyZW50IFBD
SSBkZXZpY2Ugd2lsbCByZWR1Y2UgcmVmIGNvdW50ZXIKPiA+PiB3aGVuIGNvbnRyb2xsZXIgMiBy
dW4gdGltZSBzdXNwZW5kLCBwYXJlbnQgUENJIGRldmljZSB3aWxsIHJlZHVjZSByZWYgY291bnRl
cgo+ID4+Cj4gPj4gT25seSBydW50aW1lIHBtIHJlZmVyZW5jZSBjb3VudGVyIG9mIFBDSSBkZXZp
Y2UgaXMgMCwgUENJIGRldmljZSdzIHJ1biB0aW1lCj4gPj4gc3VzcGVuZCB3aWxsIGJlIGNhbGxl
ZCwgeW91IGNhbiBkbyBhY3R1YWwgZGlzYWJsZSBhbmQgc2F2ZSB3b3JrLgo+ID4KPiA+IFRoaXMg
c291bmRzIHRvIG1lIGxpa2UgaXQgc2hvdWxkIHdvcmsuCj4gU28sIGxpa2UgdGhpcywgdGhlbj8K
Pgo+ICAgICAgICAgUENJIGRldmljZSAgICAgIFJ1bnRpbWUgUE0gZW5hYmxlZAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIEZvciBlYWNoIGNvbnRyb2xsZXI6Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBDYWxsIGludG8gbWlwaS1pM2MtaGNpICh3aGVuIGl0IGlzIHNhZmUpCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFJ1bnRpbWUgc3VzcGVuZDog
ZGlzYWJsZSBhbmQgc2F2ZSBzdGF0ZQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBSdW50aW1lIHJlc3VtZTogcmVzdG9yZSBzdGF0ZSBhbmQgZW5hYmxlCj4KPiAgICAg
ICAgIENvbnRyb2xsZXIgMSAgICBSdW50aW1lIFBNIGVuYWJsZWQgcGx1cyBhdXRvLXN1c3BlbmQK
PiAgICAgICAgICAgICAgICAgICAgICAgICBJM0Mgc3Vic3lzdGVtIHJ1bnRpbWUgUE0gZ2V0cy9w
dXRzIHRoZSBQbGF0Zm9ybSBkZXZpY2UKPiAgICAgICAgICAgICAgICAgICAgICAgICBSdW50aW1l
IHN1c3BlbmQ6IGRvZXMgbm90aGluZwo+ICAgICAgICAgICAgICAgICAgICAgICAgIFJ1bnRpbWUg
cmVzdW1lOiBkb2VzIG5vdGhpbmcKPgo+ICAgICAgICAgQ29udHJvbGxlciAyICAgIFJ1bnRpbWUg
UE0gZW5hYmxlZCBwbHVzIGF1dG8tc3VzcGVuZAo+ICAgICAgICAgICAgICAgICAgICAgICAgIEkz
QyBzdWJzeXN0ZW0gcnVudGltZSBQTSBnZXRzL3B1dHMgdGhlIFBsYXRmb3JtIGRldmljZQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIFJ1bnRpbWUgc3VzcGVuZDogZG9lcyBub3RoaW5nCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgUnVudGltZSByZXN1bWU6IGRvZXMgbm90aGluZwoKSSB3b3Vs
ZCB0aGluayBzby4KCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtaTNjCg==
