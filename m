Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F11BC982FA
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Sep 2026 10:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F9HRRaietL2jVfjTAFDBA1V/CkV+YWvWe1w7jdVV9OE=; b=gXPsndWxJzhbhf
	p4ybZI6poPMfJavTiw0+uq6Qy4orcsoLsWoUSsEBXW3FweZeGzjartVl6gtrKCtS4q85zW22F0ZKy
	e5MEK5NSx+CiuAqUAsWR87fjT88eJ9v2l6U4evWMClDzqzwZz85ly5/0rsZ5oJdA4kuXffmQsOKP0
	v4WiYr5dF3h9qfha28tvFbfM5FgdpFo/fN4LgHtBhXokVu+WG+VkwcIdTwHBYR76mYQeWglhDif8z
	UKVfCrqamGfc/KEMwFT5vc4W+nskV12PnAvaTEkpGSnbijjRUzrl8BDEa2ZMiDRQeTyEyfa5cMn+6
	qZpxGQPNIuNgigIikX6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8y4r-000000056lV-3mJU;
	Tue, 22 Sep 2026 10:50:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8y4q-000000056lC-2XEb
	for linux-i3c@lists.infradead.org;
	Tue, 22 Sep 2026 10:50:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 02EEF43806;
	Tue, 22 Sep 2026 10:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685311F000FF;
	Tue, 22 Sep 2026 10:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790074219;
	bh=D7joL9jnBPIgpSCdigDprJQYjlUtilYbRowEWg3+3u0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oYITFY1100Pe9vg0QKxTIINdYmmQblmKWbmDSg4NXd4pQsmEj3YdOBa0knyjy/pXJ
	 3MqJOIPs4nphaG8lZPNrITJ5JyghZAABJ7pN1DVBe9Il+T0k7jAQ1cXI1CTGP9TihG
	 5IuE4X6W5E8VoKOY9XzEB/ZDtz43Y/MMGxBA9xJeYY8CPMNEcstf7jTfCmT7zm+1EX
	 HIJAJnbCg0/E3Dhq54W2Z+UBImsGS54Y69Pe2XRT+4UIujS0rD9k4DbALVyI7xayFN
	 gOt+SLkZm1wVcjyQIf+4eHMVsX1qdISkCNIcXU4olUbLXATOkU1aHE9or+3BAa0Gzi
	 eUXQWzxBflYpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c
 hub and on-die regulator
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: Frank.Li@kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260922103551.2754613-5-lakshay.piplani@nxp.com>
References: <20260922103551.2754613-1-lakshay.piplani@nxp.com>
 <20260922103551.2754613-5-lakshay.piplani@nxp.com>
Date: Tue, 22 Sep 2026 10:50:19 +0000
Message-Id: <20260922105019.685311F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gbWZkOiBkcml2ZXItc3Bl
Y2lmaWMgaGVhZGVyIGluY29ycmVjdGx5IHBsYWNlZCBpbiBnbG9iYWwgaW5jbHVkZS9saW51eC9t
ZmQvCi0tCgpjb21taXQgZWUwMDIwYzM1NTE1NzA1MDYzMmEzOWI1MWMzMzc5ODUzNmFjMzMzYQpB
dXRob3I6IEFtYW4gS3VtYXIgUGFuZGV5IDxhbWFuLmt1bWFycGFuZGV5QG54cC5jb20+CgogICAg
bWZkOiBwM2gyeDR4OiBBZGQgZHJpdmVyIGZvciBOWFAgUDNIMng0eCBpM2MgaHViIGFuZCBvbi1k
aWUgcmVndWxhdG9yCgpUaGlzIGNvbW1pdCBhZGRzIGNvcmUgTUZEIHN1cHBvcnQgZm9yIHRoZSBO
WFAgUDNIMng0eCBmYW1pbHkgb2YgbXVsdGlwb3J0IEkzQwpodWIgZGV2aWNlcy4gVGhlIGRldmlj
ZXMgY29ubmVjdCB0byBhIGhvc3QgdmlhIEkzQy9JMkMvU01CdXMgYW5kIGV4cG9zZQptdWx0aXBs
ZSBkb3duc3RyZWFtIHRhcmdldCBwb3J0cy4KCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
bWZkL3AzaDI4NDAuaCBiL2luY2x1ZGUvbGludXgvbWZkL3AzaDI4NDAuaAo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwMC4uZWI0NzkyZGU1NDQwZQo+IC0tLSAvZGV2
L251bGwKPiArKysgYi9pbmNsdWRlL2xpbnV4L21mZC9wM2gyODQwLmgKPiBAQCAtMCwwICsxLDQx
IEBACj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCj4gKy8qCj4gKyAq
IENvcHlyaWdodCAyMDI1LTIwMjYgTlhQCj4gKyAqLwo+ICsKPiArI2lmbmRlZiBfTElOVVhfTUZE
X1AzSDI4NDBfSAo+ICsjZGVmaW5lIF9MSU5VWF9NRkRfUDNIMjg0MF9ICgpbU2V2ZXJpdHk6IExv
d10KQ291bGQgdGhpcyBuZXdseSBpbnRyb2R1Y2VkIGRyaXZlci1zcGVjaWZpYyBoZWFkZXIgYmUg
bW92ZWQgdG8gdGhlIGxvY2FsCmRyaXZlcnMvbWZkLyBkaXJlY3RvcnkgaW5zdGVhZCBvZiBiZWlu
ZyBwbGFjZWQgaW4gdGhlIGdsb2JhbAppbmNsdWRlL2xpbnV4L21mZC8gc3BhY2U/CgpUaGUgTUZE
IHN1YnN5c3RlbSBndWlkZWxpbmVzIHNwZWNpZnkgdGhhdCBkcml2ZXItc3BlY2lmaWMgaGVhZGVy
cyBjb250YWluaW5nCnByaXZhdGUgc3RydWN0dXJlcyBsaWtlIHN0cnVjdCBwM2gyeDR4IHNob3Vs
ZCBub3QgYmUgcGxhY2VkIGluIHRoZSBnbG9iYWwKaW5jbHVkZS9saW51eC9tZmQvIGRpcmVjdG9y
eSBpZiB0aGV5IGFyZSBvbmx5IHVzZWQgYnkgdGhlIHBhcmVudCBhbmQgaXRzCmltbWVkaWF0ZSBj
aGlsZHJlbi4KClBsYWNpbmcgaXQgaGVyZSBjYXVzZXMgYSBsYXllcmluZyB2aW9sYXRpb24gYW5k
IGludHJvZHVjZXMgdGlnaHQgY291cGxpbmcgYnkKcG9sbHV0aW5nIHRoZSBnbG9iYWwgaW5jbHVk
ZSBzcGFjZSBhdCBjb21waWxlIHRpbWUuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTIyMTAzNTUxLjI3NTQ2MTMtMS1sYWtzaGF5
LnBpcGxhbmlAbnhwLmNvbT9wYXJ0PTQKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4
LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtaTNjCg==
