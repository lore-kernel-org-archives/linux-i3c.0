Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDCEC43458
	for <linux-i3c@archiver.kernel.org>; Tue, 14 Jul 2026 10:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UTYQYNI0EOXUtlXXpjlnf3wLsqdkBOpNKz4LRxN2g80=; b=QnoLEybpKW8bb2
	Ey5B0BTEWp++Je40JpXd3ORP0JrS/zLq4RHvCeweUsDFcBdIRbZlKkEl9UYliWYTY2zhfnI6q7oe+
	2qMdYX514jHeiGEf+gAjyGSKPHaQf6haLwr5/3oZaF6HODW2RxsHBc85luq0sHnXWTgRtF5l0d7y9
	sMVcWXl0mKsvlZjXB/5AFYFwSRqvkPc2m7A+jFDhu4MroGrRb5alfKtiHnka1oVsAUB++SfzFN7ba
	Qepcz1Q3HVextwZQ+36SmcyjCnJt8PYbq5b3pJR0jijeXEDEoJ2s5IfRKmCUWlL0ZwFuRKDIpq2OB
	D68NusG1ulWYtgfvW0dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjapN-0000000BczJ-2Ewj;
	Tue, 14 Jul 2026 10:57:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjapL-0000000Bcyw-3VHx
	for linux-i3c@lists.infradead.org;
	Tue, 14 Jul 2026 10:57:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F3B6401AE;
	Tue, 14 Jul 2026 10:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0739E1F00A3A;
	Tue, 14 Jul 2026 10:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784026647;
	bh=q1AaoEK4bYh3i5GDpj3wQ4+SNcuPkGLyWx5d/VFYvNQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kRgpfG3GMiTxfLqKuf364W6vGSQ/enTgRVRJ7RH4sImvAMCriz9AyAicpPaEfAXZB
	 puxaQUSaPwP2KiUxG1TwSRWdDtXrCHeNfb1uVzzNscTI+4jgfyFCNIXxt3zO1qlmM/
	 o2rRXdB1fm1quCXG7Zr2eTrGbXEedGzVoTHD/fNlhycFLcNuggMKn+D0UPte8Vn+pB
	 pnIHf+icxh5v8iWEkkfXTVIV+ivlRkGtwKZYz2iHZqCO043LqOMhOUqZWSb+hcfylW
	 a7qeO7csP/9AM4P7OoV8G79tdhRxahE7KJijFK7w5xL7rkyyXPIIQKpBCug+292aBk
	 VHktnCSzuxEBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 5/8] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714092053.2461482-6-lakshay.piplani@nxp.com>
References: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
 <20260714092053.2461482-6-lakshay.piplani@nxp.com>
Date: Tue, 14 Jul 2026 10:57:26 +0000
Message-Id: <20260714105727.0739E1F00A3A@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gVGhlIGRyaXZlci1zcGVj
aWZpYyBoZWFkZXIgYHAzaDI4NDAuaGAgaXMgaW1wcm9wZXJseSBwbGFjZWQgaW4gdGhlIGdsb2Jh
bCBgaW5jbHVkZS9saW51eC9tZmQvYCBkaXJlY3RvcnkgaW4gdmlvbGF0aW9uIG9mIE1GRCBzdWJz
eXN0ZW0gZ3VpZGVsaW5lcy4KLS0KCi0tLSBQYXRjaCBbNV06IFtQQVRDSCB2MTQgNS84XSByZWd1
bGF0b3I6IHAzaDJ4NHg6IEFkZCBkcml2ZXIgZm9yIG9uLWRpZSByZWd1bGF0b3JzIGluIE5YUCBQ
M0gyeDR4IGkzYyBodWIgLS0tCmNvbW1pdCBkZWUxZmFmNGMyMWRmYTdmNWM4MTViZmRjODM3NmZm
YTMxNThmYmZlCkF1dGhvcjogQW1hbiBLdW1hciBQYW5kZXkgPGFtYW4ua3VtYXJwYW5kZXlAbnhw
LmNvbT4KCnJlZ3VsYXRvcjogcDNoMng0eDogQWRkIGRyaXZlciBmb3Igb24tZGllIHJlZ3VsYXRv
cnMgaW4gTlhQIFAzSDJ4NHggaTNjIGh1YgogICAgClRoZSBOWFAgUDNIMng0eCBmYW1pbHkgaW50
ZWdyYXRlcyBvbi1kaWUgcmVndWxhdG9ycyBhbG9uZ3NpZGUgSTNDIGh1YgpmdW5jdGlvbmFsaXR5
LiBUaGlzIGRyaXZlciByZWdpc3RlcnMgdGhlIHJlZ3VsYXRvcnMgdXNpbmcgdGhlIE1GRApmcmFt
ZXdvcmsgYW5kIGV4cG9zZXMgdGhlbSB2aWEgdGhlIHJlZ3VsYXRvciBzdWJzeXN0ZW0uCgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3JlZ3VsYXRvci9wM2gyODQwX2kzY19odWJfcmVndWxhdG9yLmMg
Yi9kcml2ZXJzL3JlZ3VsYXRvci9wM2gyODQwX2kzY19odWJfcmVndWxhdG9yLmMKPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAuLjY0NWQ0NmFkN2MyZjIKPiAtLS0g
L2Rldi9udWxsCj4gKysrIGIvZHJpdmVycy9yZWd1bGF0b3IvcDNoMjg0MF9pM2NfaHViX3JlZ3Vs
YXRvci5jCj4gQEAgLTAsMCArMSwyODQgQEAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAKPiArLyoKPiArICogQ29weXJpZ2h0IDIwMjUtMjAyNiBOWFAKPiArICogTlhQIFAz
SDJYNFggcmVndWxhdG9yIGRyaXZlciBmaWxlIGNvbnRhaW4gZnVuY3Rpb25zIGZvciBlbmFibGUv
ZGlzYWJsZSByZWd1bGF0b3IKPiArICogYW5kIHZvbHRhZ2Ugc2V0L2dldC4KPiArICovCj4gKyNp
bmNsdWRlIDxsaW51eC9iaXRmaWVsZC5oPgo+ICsjaW5jbHVkZSA8bGludXgvY2xlYW51cC5oPgo+
ICsjaW5jbHVkZSA8bGludXgvbWZkL3AzaDI4NDAuaD4KCltTZXZlcml0eTogTG93XQpBY2NvcmRp
bmcgdG8gdGhlIE1GRCBzdWJzeXN0ZW0gZ3VpZGVsaW5lcywgZHJpdmVyLXNwZWNpZmljIGhlYWRl
ciBmaWxlcyB0aGF0CmFyZSBvbmx5IHVzZWQgYnkgdGhlIHBhcmVudCBhbmQgaXRzIGltbWVkaWF0
ZSBjaGlsZHJlbiBzaG91bGQgbm90IGJlIHBsYWNlZAppbiB0aGUgZ2xvYmFsIGluY2x1ZGUvbGlu
dXgvbWZkLyBkaXJlY3RvcnkuCgpDb3VsZCBwM2gyODQwLmggYmUga2VwdCBsb2NhbCB0byBkcml2
ZXJzL21mZC8gaW5zdGVhZCBvZiBiZWluZyBleHBvc2VkIGluIHRoZQpnbG9iYWwgaW5jbHVkZSBw
YXRoPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRj
aHNldC8yMDI2MDcxNDA5MjA1My4yNDYxNDgyLTEtbGFrc2hheS5waXBsYW5pQG54cC5jb20/cGFy
dD01CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkz
Ywo=
