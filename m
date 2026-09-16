Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5A8C88E5C
	for <linux-i3c@archiver.kernel.org>; Wed, 16 Sep 2026 07:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g8bflIE9/TgNkTnKfW7Zacls3YRnCFZtLzwZvWlthmc=; b=J2eck7CthlL3rr
	92xqt3pjTDx4pdWhj4bNqzxjEmLkxIbBcSjKKXgHgu2W3QHyFpRv/7u7VSpqdtyDtBe6vB3xPQEGW
	D/OmrqQ8y8PrlAGasFZaWPZbxph5NIMAAz9j2OeZKryF0ZR+cZ3jLJhWweEmGszD1IMUBofx4syp1
	orx6ZxtTfTKI7+6k6+LMazokxljxTSAJWQ3VOYbJhVJlhLB5jVrgkf4P/nxSDXbzZWIxb1PObZoBx
	UWDZlHcem8/NFU9rjeAf6v5iqKfXXdQ47z3kcczzqyQDr3UyE5GldySdiGUBuWcKCTygGbS4hNjb4
	y+fMjC2Xy5qYUMvSByvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jrU-00000008ZKc-2eDW;
	Wed, 16 Sep 2026 07:15:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jrT-00000008ZKN-13Dj
	for linux-i3c@lists.infradead.org;
	Wed, 16 Sep 2026 07:15:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5894F602D1;
	Wed, 16 Sep 2026 07:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E7B1F000FF;
	Wed, 16 Sep 2026 07:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789542918;
	bh=PPa3o/HX9BFw0xoyZ7N3iM7Gp8/nKCepFKTkbn+SZIw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GpuqduFDugJ2lQtPvl2VLVos1JI/UeXRAOwhsUYDTbO5Vw4jl3Vyx3wV4Cl18nsK7
	 QH30nujhfiZfOlgJjv16zO3O7bwltB4JhUtbUSsD7K8bZ9u0jCG4xQKu/c6S5utBlW
	 Pmd/GHE8TDjF3PgzRg2xQ18xL9dzDDsSWC62FPrKjWxO7DnKP6jV9AwqrzS7u5tvOP
	 GYfsf+ZbC65FA786d5JxvYz9zt9JO//g3Tos8ujwSuQaivqsVAAY1AmDkgI7Hg01jy
	 8NRSZG6baFtvz4IPOfefUII9IWtCN+ABqpbf65QyBVficxYdm9CBcFcUEf0W8cpQOM
	 HlEJEz6M5I68w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 3/8] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub
 support
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: linux-i3c@lists.infradead.org, robh@kernel.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260916070728.1088801-4-lakshay.piplani@nxp.com>
References: <20260916070728.1088801-1-lakshay.piplani@nxp.com>
 <20260916070728.1088801-4-lakshay.piplani@nxp.com>
Date: Wed, 16 Sep 2026 07:15:17 +0000
Message-Id: <20260916071517.A5E7B1F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gZHQtYmluZGluZ3M6IG1p
c3NpbmcgY29tcGF0aWJsZSBpbiB0aGUgcmVxdWlyZWQgcHJvcGVydGllcyBsaXN0Ci0tCgpjb21t
aXQgOTllNWUwNzM0YThlNDAyOGQ5YjZhOTQzMGIwOTYwNGIxZmU5MzFiNwpBdXRob3I6IEFtYW4g
S3VtYXIgUGFuZGV5IDxhbWFuLmt1bWFycGFuZGV5QG54cC5jb20+CgpkdC1iaW5kaW5nczogaTNj
OiBBZGQgTlhQIFAzSDJ4NHggaTNjLWh1YiBzdXBwb3J0CgpUaGlzIGNvbW1pdCBhZGRzIGRldmlj
ZSB0cmVlIGJpbmRpbmdzIGZvciB0aGUgTlhQIFAzSDJ4NHggbXVsdGlwb3J0IEkzQwpodWIgZmFt
aWx5LiBUaGVzZSBkZXZpY2VzIGNvbm5lY3QgdG8gYSBob3N0IHZpYSBJM0MvSTJDL1NNQnVzIGFu
ZCBhbGxvdwpjb21tdW5pY2F0aW9uIHdpdGggbXVsdGlwbGUgZG93bnN0cmVhbSBwZXJpcGhlcmFs
cy4KCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2Mv
bnhwLHAzaDI4NDAueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2Mv
bnhwLHAzaDI4NDAueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAw
MDAwMC4uMDk1MDhhN2JjYmViNgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvaTNjL254cCxwM2gyODQwLnlhbWwKWyAuLi4gXQo+ICsgICAg
ICBsZG8tdHBnMToKPiArICAgICAgICB0eXBlOiBvYmplY3QKPiArICAgICAgICAkcmVmOiAvc2No
ZW1hcy9yZWd1bGF0b3IvcmVndWxhdG9yLnlhbWwjCj4gKyAgICAgICAgdW5ldmFsdWF0ZWRQcm9w
ZXJ0aWVzOiBmYWxzZQo+ICsKPiArcmVxdWlyZWQ6Cj4gKyAgLSByZWcKPiArICAtICcjYWRkcmVz
cy1jZWxscycKPiArICAtICcjc2l6ZS1jZWxscycKCltTZXZlcml0eTogTG93XQpEb2VzIHRoaXMg
bGlzdCBpbmNvcnJlY3RseSBvbWl0IHRoZSBjb21wYXRpYmxlIHByb3BlcnR5PwoKRGV2aWNlIHRy
ZWUgbm9kZXMgcmVmZXJlbmNlZCBkaXJlY3RseSB2aWEgYSBzY2hlbWEgJHJlZiBtaWdodCBpbmNv
cnJlY3RseQpwYXNzIHZhbGlkYXRpb24gaWYgdGhleSBvbWl0IHRoZSBjb21wYXRpYmxlIHByb3Bl
cnR5LCBhcyB0aGUgc2NoZW1hIGRvZXMKbm90IGVuZm9yY2UgaXRzIHByZXNlbmNlLiBJZiBhIHBh
cmVudCBzY2hlbWEgdXNlcyAkcmVmIHRvIGluY2x1ZGUgdGhpcwpzY2hlbWEgZm9yIGEgY2hpbGQg
bm9kZSwgYW5kIHRoZSBjaGlsZCBub2RlIGxhY2tzIGEgY29tcGF0aWJsZSBzdHJpbmcsCnZhbGlk
YXRpb24gd291bGQgc2lsZW50bHkgc3VjY2VlZC4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBo
dHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MTYwNzA3MjguMTA4ODgwMS0xLWxh
a3NoYXkucGlwbGFuaUBueHAuY29tP3BhcnQ9MwoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QK
bGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
