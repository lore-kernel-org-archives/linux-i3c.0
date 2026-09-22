Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC75C982F1
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Sep 2026 10:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sHNUJPUm4Po8bj7+fmSs7WIz8I4X7nLjqG5ht4Uqd5U=; b=EkQst/mdVwDMON
	Cbd2sd2zh0NdoKsGIOW3Ep8CyMXOC1GJWu32QI7RJVBgmACcNGtyJY/6LJ/5RH2SGBC1cOc785CJn
	fgkEX4m27rnBH1Q4rzcnjlmbX7rvOIiK6Weudhs6teMCWzQimI+StVLjghicoIpLrgM0BjXQcl76Z
	XIXoEdgL+owkBxotinNNYYyX5Pk53oawyNSd3LrbZ385Oebjbavh2PPOjPAzQ/9QiFNmYHM+Olpkk
	8RGnma0zpt4qMeMxb72NNZojOByAzXJ34Uu9fcyPlBeKGohdptSoNGrVgUcZ3GnjrK7Qi7ZyCyit6
	2wRVcdg05iy/Dp4XjZDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8y8O-000000057H3-06Cl;
	Tue, 22 Sep 2026 10:54:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8y8M-000000057Gc-2mzT
	for linux-i3c@lists.infradead.org;
	Tue, 22 Sep 2026 10:53:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 14F5D44044;
	Tue, 22 Sep 2026 10:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABFF1F00893;
	Tue, 22 Sep 2026 10:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790074438;
	bh=riCH2xQeou67pdAof+xjMVRgwfKowBYXjXWeRpybbYA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fT8BFfzXtvBTSdLUjSZQFAYdS+uWS9zSq9XVo571uFMT8/bZ8SLo+3OK6M53vQQQp
	 dbH4AZI88pJExhEdpC/7P6LUQmiZJ9mALcr8LcnupiOdenel8Fyy0NmogBAly6gIOk
	 IJXG7sdPsxWmq4x1emvzSRlqmxdvQm+21PFq//LbMvFRRQYSvo+DHpwbAK7HGRLmXb
	 wJJmTsC+Lidqdv+vhsNve8OhN90z3IPHDHu/+3ah1xjFHtFZBgpgJnfaDTrEeGih6I
	 pevT0+fVWzVxSZhz6dzMeFOU6qYcS43qU8KrCjS4qI+C8YzUWBD7pruUg95u7M1fFq
	 b4ebKE+h5kWtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 6/8] i3c: hub: Add support for the I3C interface in
 the I3C hub
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260922103551.2754613-7-lakshay.piplani@nxp.com>
References: <20260922103551.2754613-1-lakshay.piplani@nxp.com>
 <20260922103551.2754613-7-lakshay.piplani@nxp.com>
Date: Tue, 22 Sep 2026 10:53:56 +0000
Message-Id: <20260922105357.5ABFF1F00893@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGkzYzogaHViOiBFTlRE
QUEtZGlzY292ZXJlZCBkb3duc3RyZWFtIGRldmljZXMgYXJlIG1pc3JvdXRlZCB0byBwYXJlbnQg
YnVzCi0tCgpjb21taXQgYmYzOTA5NzIyYmRhYmMzMGUxZDY5ZDY2NmQ1NzMyMTk5MzU2ZmI2MQpB
dXRob3I6IExha3NoYXkgUGlwbGFuaSA8bGFrc2hheS5waXBsYW5pQG54cC5jb20+CgppM2M6IGh1
YjogQWRkIHN1cHBvcnQgZm9yIHRoZSBJM0MgaW50ZXJmYWNlIGluIHRoZSBJM0MgaHViCgpUaGlz
IGNvbW1pdCBhZGRzIHZpcnR1YWwgSTNDIGJ1cyBzdXBwb3J0IGZvciBodWJzIGJ5IGNyZWF0aW5n
IHZpcnR1YWwKbWFzdGVyIGNvbnRyb2xsZXJzIGZvciBkb3duc3RyZWFtIHBvcnRzIGFuZCBmb3J3
YXJkaW5nIGJ1cyBvcGVyYXRpb25zCnRocm91Z2ggdGhlIGh1YiBkZXZpY2UuCgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2kzYy9odWIuYyBiL2RyaXZlcnMvaTNjL2h1Yi5jCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvZHJpdmVycy9pM2MvaHViLmMKWyAuLi4g
XQo+ICtzdGF0aWMgaW50IGkzY19odWJfZG9fZGFhKHN0cnVjdCBpM2NfaHViICpodWIsCj4gKwkJ
CSAgc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqY29udHJvbGxlcikKPiArewo+ICsJc3Ry
dWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqcGFyZW50Owo+ICsJaW50IHJldDsKWyAuLi4gXQo+
ICsJbXV0ZXhfbG9jaygmaHViLT5sb2NrKTsKPiArCWkzY19odWJfZW5hYmxlX3BvcnQoY29udHJv
bGxlcik7Cj4gKwo+ICsJLyoKPiArCSAqIERvd25zdHJlYW0gZGV2aWNlcyByZWFjaGFibGUgdGhy
b3VnaCBodWIgdGFyZ2V0LXBvcnQgcm91dGVzIHNoYXJlIHRoZQo+ICsJICogcGFyZW50IGNvbnRy
b2xsZXIncyBJM0MgYWRkcmVzcyBzcGFjZS4gVGhlIGh1YiBnYXRlcyBhY2Nlc3MgdG8gYQo+ICsJ
ICogdGFyZ2V0LXBvcnQgbmV0d29yaywgYnV0IGl0IGRvZXMgbm90IGNyZWF0ZSBhbiBpbmRlcGVu
ZGVudCBkeW5hbWljCj4gKwkgKiBhZGRyZXNzIGRvbWFpbiBwZXIgdmlydHVhbCBidXMuCj4gKwkg
Kgo+ICsJICogUnVuIERBQSBvbiB0aGUgcGFyZW50IGNvbnRyb2xsZXIgc28gZHluYW1pYyBhZGRy
ZXNzZXMgcmVtYWluIHVuaXF1ZQo+ICsJICogYWNyb3NzIGFsbCBkb3duc3RyZWFtIGRldmljZXMs
IGV2ZW4gd2hlbiB0aGV5IGFyZSBiZWhpbmQgZGlmZmVyZW50Cj4gKwkgKiB0YXJnZXQgcG9ydHMu
Cj4gKwkgKgo+ICsJICogVGhlIGN1cnJlbnQgaHViIG1vZGVsIHNoYXJlcyB0aGUgcGFyZW50IGNv
bnRyb2xsZXIncyBkeW5hbWljLWFkZHJlc3MKPiArCSAqIGRvbWFpbiBhbmQgZG9lcyBub3Qgc3Vw
cG9ydCBpbmRlcGVuZGVudCBwZXItcG9ydCBEQUEgZG9tYWlucywgc28gYQo+ICsJICogREFBIHJl
c3VsdCBkb2VzIG5vdCBnbyBzdGFsZSBiZWhpbmQgYSBwb3J0IHRvZ2dsZS4gQWRkcmVzc2VzIHJl
c2VydmVkCj4gKwkgKiBmcm9tIHRoZSBEZXZpY2UgVHJlZSBhcmUgaGVsZCBmb3IgdGhlIGxpZmV0
aW1lIG9mIHRoZSBwYXJlbnQgYnVzIGFuZAo+ICsJICogYXJlIG5ldmVyIHJlbGVhc2VkIG9uIGEg
cG9ydCB0b2dnbGUsIHNvIGVuYWJsaW5nIG9yIGRpc2FibGluZyBhIHBvcnQKPiArCSAqIG9ubHkg
Z2F0ZXMgcmVhY2hhYmlsaXR5IGFuZCBuZXZlciBjYXVzZXMgYW4gYWRkcmVzcyB0byBiZSBoYW5k
ZWQgb3V0Cj4gKwkgKiB0d2ljZS4KPiArCSAqLwo+ICsJcmV0ID0gaTNjX21hc3Rlcl9kb19kYWEo
cGFyZW50KTsKCltTZXZlcml0eTogSGlnaF0KRG9lcyBkZWxlZ2F0aW5nIERBQSB0byB0aGUgcGFy
ZW50IGNvbnRyb2xsZXIgaGVyZSBtaXNyb3V0ZSBuZXdseSBkaXNjb3ZlcmVkCmRvd25zdHJlYW0g
ZGV2aWNlcz8KCldoZW4gaTNjX21hc3Rlcl9kb19kYWEoKSBleGVjdXRlcyBFTlREQUEgb24gdGhl
IHBhcmVudCBjb250cm9sbGVyLCBhbnkKZG93bnN0cmVhbSBJM0MgZGV2aWNlIGxhY2tpbmcgYSBz
dGF0aWMgYWRkcmVzcyB3aWxsIGJlIGFzc2lnbmVkIGFuIGFkZHJlc3MKYW5kIGFkZGVkIGRpcmVj
dGx5IHRvIHRoZSBwaHlzaWNhbCBwYXJlbnQncyBidXMuZGV2cy5pM2MgbGlzdCBpbnN0ZWFkIG9m
CnRoZSB2aXJ0dWFsIGh1YiBidXMuCgpCZWNhdXNlIHRoZXNlIGRldmljZXMgYXJlIGF0dGFjaGVk
IGRpcmVjdGx5IHRvIHRoZSBwYXJlbnQsIHdvbid0IHRoZWlyCnN1YnNlcXVlbnQgdHJhbnNmZXJz
IGJ5cGFzcyB0aGUgdmlydHVhbCBjb250cm9sbGVyJ3MgcHJpdl94ZmVycyByb3V0aW5nPwpJZiBz
bywgdGhlIGh1YiBwb3J0IHdvdWxkIG5ldmVyIGJlIGVuYWJsZWQgZHVyaW5nIG5vcm1hbCBjb21t
dW5pY2F0aW9uLApjYXVzaW5nIGFsbCB0cmFuc2ZlcnMgdG8gdGhlIGRldmljZSB0byBmYWlsIHdp
dGggYSBOQUNLIG9yIHRpbWVvdXQuCgo+ICsJaTNjX2h1Yl9kaXNhYmxlX3BvcnQoY29udHJvbGxl
cik7Cj4gKwltdXRleF91bmxvY2soJmh1Yi0+bG9jayk7Cj4gKwo+ICsJcmV0dXJuIHJldDsKPiAr
fQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNl
dC8yMDI2MDkyMjEwMzU1MS4yNzU0NjEzLTEtbGFrc2hheS5waXBsYW5pQG54cC5jb20/cGFydD02
CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
