Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B892CC43458
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jul 2026 20:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0P+r/2BSqzVC/IupRerI4bKHMGDM3n9gnqsITOG32vU=; b=N3Ipq9Re1hCcPr
	2EX2Dw7+rs/qjtSS1WnE0b1rQ62FEnG8Nn/FVrtxkShkPpf0i3Chdx/udaKVU/uhLBnRQZ1ycRFGg
	XM2I+3hz19IYwHTDQxbJPFlpoy7eFRSl0cZxjIc4ZJCjB5Uaigf9BLuMAG76tIkZA2IQ4EtvXxbke
	g0TylA35g8II7Lgny/HqOckyJfb6jppJ02J55jibUF1xDYGIPfAw/S0cyUJgdrY9bybOj3g5Qr5kl
	36yaLSHXGEzspCXT9xhzNcAf97Sd68mIc3U2w05hMq0yJEdbM0aSBkFbG4m7rppACyqEYcmWy9PI+
	TsKEbkM9rHVHBh0jtfnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1W7-00000002xvo-1N8f;
	Wed, 01 Jul 2026 20:26:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1W5-00000002xvc-3vib
	for linux-i3c@lists.infradead.org;
	Wed, 01 Jul 2026 20:26:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E6D960138;
	Wed,  1 Jul 2026 20:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89671F000E9;
	Wed,  1 Jul 2026 20:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782937601;
	bh=PM1ZbYuyIAyS51HiGgIyUkiW7BoB0qtFt2Okm/XiTy4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ogqkEcW36ziZzrt4jXVWbP6Rd+sAIy4Rm6LAc534T6yOypg2+RECJoR+bxL1Sb/Tg
	 foso1B7xlY9fi3fq7emZbLRSvK6SxI/enV806ZiXUiu3W+HSykqZ8t2LNpmeGygl4y
	 38YQEwWYKeClcvhmvvsGrBC+DIkdZnSL849XUd5OHT3L9IoLbhPCTovYnmVE+goRXM
	 l8vmN1DKTht8kywD9U2sn/ObUmWvYH6IhrBG9m1RHb+7rodZ1eFF/2uuazVBCq1a3S
	 11omVabkrhWnlN4+KCUw4bpV7Tide6JVt/7vTvmxFDUrRsrD309GuUBh9wBemW4VSO
	 rnJ6DTbpb+Z0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 5/7] i3c: mipi-i3c-hci-pci: Propagate I3C wakeup
 requirements to PCI
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org
In-Reply-To: <20260701200552.220042-6-adrian.hunter@intel.com>
References: <20260701200552.220042-1-adrian.hunter@intel.com>
 <20260701200552.220042-6-adrian.hunter@intel.com>
Date: Wed, 01 Jul 2026 20:26:40 +0000
Message-Id: <20260701202640.D89671F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBEZXJlZmVyZW5jZSBvZiB1bnZhbGlkYXRlZCBgZHJ2ZGF0YWAgaW4gc3VzcGVuZCBw
YXRoIGxlYWRzIHRvIE5VTEwgcG9pbnRlciBjcmFzaCBpZiBjaGlsZCBkcml2ZXIgaXMgdW5ib3Vu
ZC4KLS0KCmNvbW1pdCAxYTY1MmYyZDkyNTJhYTU1MjU4ZTQ0ZDA5NWUwOWY0MTJhOTY2MzM3CkF1
dGhvcjogQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+CgppM2M6IG1pcGkt
aTNjLWhjaS1wY2k6IFByb3BhZ2F0ZSBJM0Mgd2FrZXVwIHJlcXVpcmVtZW50cyB0byBQQ0kKICAg
IApLZWVwIHRoZSBQQ0kgd2FrZXVwIHN0YXRlIGFsaWduZWQgd2l0aCB0aGUgd2FrZXVwIHJlcXVp
cmVtZW50cyBvZiB0aGUgZGV2aWNlcwpzZXJ2ZWQgYnkgdGhlIGNvbnRyb2xsZXIocykuIEl0IGNo
ZWNrcyB3aGV0aGVyIGFueSBIQ0kgaW5zdGFuY2UgaGFzIGEKd2FrZXVwLWVuYWJsZWQgSTNDIGRl
dmljZSBhbmQgZW5hYmxlcyB3YWtldXAgZm9yIHRoZSBQQ0kgZnVuY3Rpb24uCgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL21pcGktaTNjLWhjaS1wY2kuYyBi
L2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvbWlwaS1pM2MtaGNpLXBjaS5jCj4gaW5k
ZXggNWE5ZTJhNDNlZmY4ZC4uMmIzYmY2ZmE3NGYyOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kz
Yy9tYXN0ZXIvbWlwaS1pM2MtaGNpL21pcGktaTNjLWhjaS1wY2kuYwo+ICsrKyBiL2RyaXZlcnMv
aTNjL21hc3Rlci9taXBpLWkzYy1oY2kvbWlwaS1pM2MtaGNpLXBjaS5jClsgLi4uIF0KPiBAQCAt
MjcyLDYgKzI3NCwxMyBAQCBzdGF0aWMgYm9vbCBtaXBpX2kzY19oY2lfcGNpX2lzX21mZChzdHJ1
Y3QgZGV2aWNlICpkZXYpCj4gIAlyZXR1cm4gZGV2X2lzX3BsYXRmb3JtKGRldikgJiYgbWZkX2dl
dF9jZWxsKHRvX3BsYXRmb3JtX2RldmljZShkZXYpKTsKPiAgfQo+ICAKPiArc3RhdGljIGJvb2wg
bWlwaV9pM2NfaGNpX3BjaV9hbnlfd2FrZXVwX2VuYWJsZWQoc3RydWN0IGRldmljZSAqZGV2KQo+
ICt7Cj4gKwlzdHJ1Y3QgaTNjX2hjaSAqaGNpID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gKwo+
ICsJcmV0dXJuIGkzY19tYXN0ZXJfYW55X3dha2V1cF9lbmFibGVkKCZoY2ktPm1hc3Rlcik7Cj4g
K30KPiArCgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXMgYSBwcmUtZXhpc3RpbmcgaXNzdWUsIGJ1
dCBkb2VzIHRoaXMgY29kZSBsZWFkIHRvIGEgTlVMTCBwb2ludGVyCmRlcmVmZXJlbmNlIGlmIHRo
ZSBjaGlsZCBkcml2ZXIgaXMgdW5ib3VuZD8KCklmIGEgcHJpdmlsZWdlZCB1c2VyIHVuYmluZHMg
dGhlIG1pcGlfaTNjX2hjaSBkcml2ZXIgZnJvbSBhIGNoaWxkIHBsYXRmb3JtCmRldmljZSB2aWEg
c3lzZnMsIGRydmRhdGEgaXMgY2xlYXJlZCB0byBOVUxMLgoKQmVjYXVzZSB0aGUgZHJpdmVyJ3Mg
cmVtb3ZlIGNhbGxiYWNrIGRvZXMgbm90IGRpc2FibGUgdGhlIGhhcmR3YXJlIGNvbnRyb2xsZXIK
b3IgY2xlYXIgdGhlIEhDX0NPTlRST0xfQlVTX0VOQUJMRSByZWdpc3RlciBiaXQsIAptaXBpX2kz
Y19oY2lfcGNpX2lzX29wZXJhdGlvbmFsKCkgY2FuIHN0aWxsIHJldHVybiB0cnVlIGZvciB0aGlz
IGRldmljZQpkdXJpbmcgYSBzdWJzZXF1ZW50IHN5c3RlbSBzdXNwZW5kLgoKVGhlIFBDSSBzdXNw
ZW5kIGluc3RhbmNlIGl0ZXJhdG9yIHRoZW4gcGFzc2VzIHRoZSBwb3RlbnRpYWxseSB1bmJvdW5k
IGRldmljZQppbnRvIHRoaXMgbmV3IGZ1bmN0aW9uLCB3aGljaCBmZXRjaGVzIHRoZSBOVUxMIGRy
dmRhdGEgYW5kIGJsaW5kbHkgCmRlcmVmZXJlbmNlcyBpdC4KClRoZSBwcmUtZXhpc3RpbmcgaTNj
X2hjaV9ycG1fc3VzcGVuZCgpIGZ1bmN0aW9uIGNhbGxlZCBlYXJsaWVyIGluIHRoZSBzYW1lCnN1
c3BlbmQgcGF0aCBhcHBlYXJzIHRvIHN1ZmZlciBmcm9tIHRoZSBleGFjdCBzYW1lIHByb2JsZW06
Cgpjb3JlLmM6aTNjX2hjaV9ycG1fc3VzcGVuZCgpIHsKCXN0cnVjdCBpM2NfaGNpICpoY2kgPSBk
ZXZfZ2V0X2RydmRhdGEoZGV2KTsKCgkvKiBGYWxsIGJhY2sgdG8gc29mdHdhcmUgcmVzZXQgdG8g
ZGlzYWJsZSB0aGUgYnVzICovCglpZiAoaTNjX2hjaV9idXNfZGlzYWJsZShoY2kpKQogICAgICAg
IC4uLgp9CgpTaG91bGQgdGhlIHN1c3BlbmQgcGF0aCB2YWxpZGF0ZSB0aGF0IGRydmRhdGEgaXMg
bm9uLU5VTEwgb3IgdGhhdCB0aGUgZHJpdmVyCmlzIGFjdHVhbGx5IGJvdW5kIGJlZm9yZSBwcm9j
ZWVkaW5nIHdpdGggdGhlc2Ugc3VzcGVuZCBvcGVyYXRpb25zPwoKLS0gClNhc2hpa28gQUkgcmV2
aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcwMTIwMDU1Mi4yMjAw
NDItMS1hZHJpYW4uaHVudGVyQGludGVsLmNvbT9wYXJ0PTUKCi0tIApsaW51eC1pM2MgbWFpbGlu
ZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
