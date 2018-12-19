Return-Path: <SRS0=3k/h=O4=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E3BC43387
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Dec 2018 14:17:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FB302084A
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Dec 2018 14:17:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GGOGE3Xe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqZsdkrn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FB302084A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ivkk54xLcfFI1KxmisQs104AfOviQtuRFZJgNQtqHi8=; b=GGOGE3Xe8GQ/QN
	1Pq+zZnrObaKNqhojB0U4q3i6f0a8hPbomWWaaqzsNPLgDvyz6g+0aZVQeIt3lYxhWOe/2LvPQYE9
	B3BHt5eW6GmEQfHh+cByzW38F62C5RLXCUK04zvfhQiIMmDSAysrA9gfvu51NMKHADh3Qoz5VmNkR
	2sIqr8dc876K4jazEC7B4SuqqXTENcvsQrumXp8Qk+FjHEj9gnqzprSZxemqX0eG0AKRKeTTIQC03
	JgkyzwUU2xOTzKA1R87lVtqbRSP0S7fRoDPfRMzYoYRqjWEIw4DJNrtO0aZ+GyAco+hcTuLcKmq1x
	xLIBA475sYTkhI9BttrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZcez-0003MR-Ij; Wed, 19 Dec 2018 14:17:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZcew-0003Lq-Ki
 for linux-i3c@lists.infradead.org; Wed, 19 Dec 2018 14:17:16 +0000
Received: from bbrezillon (aaubervilliers-681-1-38-38.w90-88.abo.wanadoo.fr
 [90.88.157.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED4332084A;
 Wed, 19 Dec 2018 14:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1545229024;
 bh=8+OUHDuydNQspQEpT4fqZafCgCEUQVKM0URNVQqSRZA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gqZsdkrnwbVDpXzd7aAvizoi3nbhKMq4qlJRVIK7SiO+64qEaZqDXO4suO61h2GSc
 ospON4L4rVN/xh11kQbiWRCbqjyoIib6kMbd+Ifu7GQ3robX1vCa/z3/M4eORsT1M/
 xlYa67aHbCE5Z0/ENL1oxWz+jTu4LSobsJZ+YV+w=
Date: Wed, 19 Dec 2018 15:16:59 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH 1/2] i3c: Add support for mastership request to I3C
 subsystem
Message-ID: <20181219151659.44c98a21@bbrezillon>
In-Reply-To: <00C3A803-C011-4971-B7F8-BB5B838D9AE4@cadence.com>
References: <cover.1544703840.git.pgaj@cadence.com>
 <68ffa8026fb3cc32415058861ece07f158b00647.1544703840.git.pgaj@cadence.com>
 <20181213145020.124cb103@bbrezillon>
 <DCAE2FA2-D22C-4010-A13C-3413DBCF4721@cadence.com>
 <20181214092407.4882ef31@bbrezillon>
 <00C3A803-C011-4971-B7F8-BB5B838D9AE4@cadence.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181219_061714_715026_DE0DEC0F 
X-CRM114-Status: GOOD (  22.14  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 Przemyslaw Sroka <psroka@cadence.com>, Rafal Ciepiela <rafalc@cadence.com>,
 "vitor.soares@synopsys.com" <vitor.soares@synopsys.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxNCBEZWMgMjAxOCAxMzo0NzozOSArMDAwMApQcnplbXlzbGF3IEdhaiA8cGdhakBj
YWRlbmNlLmNvbT4gd3JvdGU6Cgo+ID4+PiBAQCAtMjQ5Nyw2ICsyNjI5LDEzIEBAIGludCBpM2Nf
bWFzdGVyX3JlZ2lzdGVyKHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1hc3RlciwKPiA+
Pj4gCQlnb3RvIGVycl9kZWxfZGV2Owo+ID4+PiAKPiA+Pj4gCS8qCj4gPj4+ICsJICogV2UgY2Fu
IHN0b3AgaGVyZS4gRGV2aWNlcyB3aWxsIGJlIGF0dGFjaGVkIGFmdGVyIGJ1cyB0YWtlb3Zlci4K
PiA+Pj4gKwkgKiBTZWNvbmRhcnkgbWFzdGVycyBjYW4ndCBkbyBEQUEuCj4gPj4+ICsJICovCj4g
Pj4+ICsJaWYgKG1hc3Rlci0+c2Vjb25kYXJ5KQo+ID4+PiArCQlyZXR1cm4gMDsgICAgCj4gPj4g
Cj4gPj4gICAgU2VlLCBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBzdG9wIGhlcmUuIFdlIHNob3Vs
ZCBwcm92aWRlIGEgaG9vayB0byBsZXQKPiA+PiAgICBzZWNvbmRhcnkgc2xhdmVzIHBvcHVsYXRl
IHRoZSBkZXYgbGlzdCBiYXNlZCBvbiBkYXRhIHRoZXkgbWlnaHQgaGF2ZQo+ID4+ICAgIHJlY2Vp
dmVkIGJlZm9yZSB0aGF0Lgo+ID4+IAo+ID4+IERvIHdlIHdhbnQgdG8gcG9wdWxhdGUgbGlzdCB3
aXRoIGRhdGEgcmVjZWl2ZWQgYnkgREVGU0xWUz8gICAKPiA+IAo+ID4gSSBndWVzcyB3ZSBkby4g
SSBtZWFuLCB3ZSBzaG91bGRuJ3QgcG9wdWxhdGUgdGhlIGxpc3QgZGlyZWN0bHksIGJ1dAo+ID4g
d2Ugc2hvdWxkIHJlcXVlc3QgYnVzIG93bmVyc2hpcCwgYW5kIHRoZW4gYWRkIEkzQyBkZXZpY2Vz
IG9uZSBieSBvbmUKPiA+IHVzaW5nIGkzY19tYXN0ZXJfYWRkX2kzY19kZXZfbG9ja2VkKCkuIFRo
aXMgZnVuY3Rpb24gd2lsbCBkbyB0aGUgcmVzdAo+ID4gKHF1ZXJ5IFBJRCwgQkNSLCBEQ1IsIC4u
LiBhbmQgdGhlbiBhZGQgdGhlIGRldmljZSB0byB0aGUgbGlzdCkuCj4gPiAgIAo+ID4+IElmIHll
cywgSSBjYW4gcG9wdWxhdGUgbGlzdCBidXQgd2UgYXJlIG5vdCBhYmxlIHRvIHJlZ2lzdGVyIGRl
dmljZXMgYmVjYXVzZSB3ZSBkb27igJl0IGhhdmUgCj4gPj4gUElEIHlldCBhbmQgZGV2aWNlIGRy
aXZlcnMgYXJlIG1hdGNoZWQgYnkgUElELiAgCj4gPiAKPiA+IE5vdyBJIHVuZGVyc3RhbmQgd2h5
IHlvdSB3YW50IGl0IHRvIGJlIGRyaXZlbiBieSBFTkVDKE1SKS4gQ2FuJ3Qgd2UKPiA+IGhhdmUg
YSBzaXR1YXRpb24gd2hlcmUgaTNjX21hc3Rlcl9yZWdpc3RlcigpIGlzIGNhbGxlZCBhZnRlciBp
dCBoYXMKPiA+IHJlY2VpdmVkIGJvdGggREVGU0xWIGFuZCBFTkVDKE1SKS4gU2hvdWxkbid0IHdl
IHJlcXVlc3QgYnVzIG93bmVyc2hpcAo+ID4gZGlyZWN0bHkgYXQgaW5pdCB0aW1lIGluIHRoaXMg
Y2FzZS4gIAo+IAo+IEkgdGhpbmsgaXQncyBwb3NzaWJsZSBhbmQgSSB0aGluayB3ZSBzaG91bGQg
cmVxdWVzdCBtYXN0ZXJzaGlwIGFuZCBmaW5pc2gKPiBpbml0aWFsaXphdGlvbiBpbiB0aGlzIGNh
c2UuIEFuZCB3aGF0IGlmIE1SIGlzIGRpc2FibGVkIGR1cmluZyBpbml0aWFsaXphdGlvbj8KClRo
ZW4geW91J2QgaGF2ZSB0byBkZWxheSB0aGlzIHBhcnQgdW50aWwgRU5FQyhNUikgaXMgcmVjZWl2
ZWQsIHNvIG1heWJlCml0J3MganVzdCBlYXNpZXIgdG8gbGV0IG1hc3RlciBjb250cm9sbGVyIGRy
aXZlcnMgaGFuZGxlIHRoYXQgcGFydCBvbgp0aGVpciBvd24uCgo+IERvIHdlIHdhbnQgdG8gd2Fp
dCBmb3IgREVGU0xWUyBvciBFTkVDKE1SKSBldmVudCBhbmQgdGhlbiBmaW5pc2gKPiBpbml0aWFs
aXphdGlvbj8gSSBqdXN0IHdhbnRlZCB0byBoYXZlIGdlbmVyaWMgc29sdXRpb24gZm9yIGJvdGgg
Y2FzZXMuCgpJdCByZWFsbHkgZGVwZW5kcyB3aGF0IHdlIG1lYW4gYnkgImJ1cyBpbml0aWFsaXph
dGlvbiIuIElmIHdlIGRlY2lkZQp0aGF0IHNlY29uZGFyeSBtYXN0ZXIgYnVzIGluaXQgaXMganVz
dCBhYm91dCBpbml0aWFsaXppbmcgdGhlCmkzY19tYXN0ZXJfY29udHJvbGxlciBhbmQgaTNjX2J1
cyBzdHJ1Y3RzIChhbmQgbWF5YmUgZW5hYmxlIHRoZQpjb250cm9sbGVyIGFuZCBzZW5kIGFuIEhK
IGV2ZW50IG9uIHRoZSBidXMpIGFuZCBub3RoaW5nIG1vcmUsIHRoZW4gd2UKc2hvdWxkIGxldCBJ
M0MgbWFzdGVyIGNvbnRyb2xsZXIgZHJpdmVycyByZWdpc3RlciBJM0MgZGV2IG9uIHRoZWlyIG93
bi4KCj4gCj4gPiAKPiA+IExvb2tzIGxpa2UgYWxsIG9mIHRoaXMgd2lsbCBiZSBJM0MgbWFzdGVy
IGNvbnRyb2xsZXIgZHJpdmVuIHRob3VnaCwgc28KPiA+IG1heWJlIGl0J3MganVzdCBiZXR0ZXIg
dG8gbGV0IG1hc3RlciBkcml2ZXJzIGhhbmRsZSBhbGwgb2YgdGhhdCBvbgo+ID4gdGhlaXIgb3du
LiAgCj4gCj4gU28sIEkgY2FuIHRyeSBhZGRpbmcgZGV2aWNlcyByZWNlaXZlZCBieSBERUZTTFZT
IG9uIGRyaXZlciBzaWRlIGFuZAo+IHRoZW4gY2FsbCBpM2NfbWFzdGVyX3JlZ2lzdGVyKCkuIElz
IHRoYXQgd2hhdCB5b3UgbWVhbnQ/IEknbSBzb3JyeSBpZiBJCj4gbWlzdW5kZXJzdG9vZCBzb21l
dGhpbmcuCgpJIGRvbid0IGtub3cuIEkgd2FzIGp1c3QgdGhpbmtpbmcgb3V0IGxvdWQuIFJpZ2h0
IG5vdywgSSBjYW4ndCB0ZWxsCndoaWNoIG9wdGlvbiBpcyBiZXN0OgoKMS8gcHJvdmlkZSBhIG1p
bmltYWwgc2Vjb25kYXJ5IG1hc3RlciBpbml0IHJvdXRpbmUgYW5kIGxldCBkcml2ZXJzIGRvCiAg
IGFsbCB0aGUgaGFyZCB3b3JrCjIvIHByb3ZpZGUgYW4gYXV0b21hdGVkIHByb2NlZHVyZSB0byBz
aW1wbGlmeSBkcml2ZXIncyBsaWZlIGFuZCB0YWtlCiAgIHRoZSByaXNrIG9mIG1ha2luZyBpdCB0
b28gcmVzdHJpY3RpdmUKCklmIEkgaGFkIHRvIHdvcmsgb24gdGhhdCwgSSdkIHByb2JhYmx5IGdv
IGZvciBvcHRpb24gIzEgYW5kIHRyeSB0bwpyZWZpbmUgdGhpbmdzIHdoZW4gd2Ugc3RhcnQgaGF2
aW5nIG1vcmUgY29udHJvbGxlcnMsIGJ1dCBJIG1pZ2h0IGJlCndyb25nLgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWkzYyBtYWlsaW5nIGxp
c3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
