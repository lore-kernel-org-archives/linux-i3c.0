Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DC4C2A09B
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Aug 2026 15:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6uaRngiOkRyUfpUiMicpf95krGawCqhQIc/WaJwAXw=; b=15uzRaOdvnZnJ1
	q+xG7FOdRiXvTqio4Y/wrrAHK8HWeccY+Oel31frQFpiWIsCOdJLOpVzZ/7riwmrIXnWV5ajGghOg
	t+TJ5w0krd2kjrfXzBv54l3wosof0N3/sweMSDeMLHRjhd23TwKBktVNEMUm+6LrJ2IVw3b/7shrZ
	krT2wKdX23zfm6gyxDHRtqMWBs6b5iMSoqqgIKtoDyHQBwApN6xBHYpkco6ZsiNcJzQysnFkxOocZ
	1kxiSLmJFEtj7t7OyLcaao493as1U+SvD7s8ZqMAWXlq/i3mjRIJ6SRB613HdkYgX8ZKYMttp3F0R
	0/RqK53tb6FIhQePpe7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMgW-00000008Mdt-0rMH;
	Fri, 07 Aug 2026 15:40:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMgV-00000008Mdn-1tOV
	for linux-i3c@lists.infradead.org;
	Fri, 07 Aug 2026 15:40:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E666840600;
	Fri,  7 Aug 2026 15:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87BED1F000E9;
	Fri,  7 Aug 2026 15:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786117234;
	bh=aFWzsoJRqmLexpfzHPbCkHpX2YjdJdScMlnqcX19Z4k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EiHirnDe5LfkW9Nt4M81QqzXZy0BRLuu3gRzFrRzNZQ7+/CZCsC4+pVMToNCD1/8Q
	 5hMj1Wr1uJzwN5EooCabJhznNcySYFq5STrheUTGrbVVV98YPnNDfRBFK/EFg8pmp3
	 lM5+sbr4Zc6Zod6SGVWQKd5C945i7sv3QGdA+xlJvKwUmOGJ3jhMjtCO/bvoeVp/ze
	 idYQEt7TnRSp8Hl6h9tNTL49on37+sSLyT6P3zFtD+ZpOD4MqSxNkRUec+qP4OwrdJ
	 AhQhsERIhvLT4TnThWcddjcWo8nfj1EbxKOyujBgCp9GlB6oL09Wo052q8K8MjsV2b
	 6aQbIXkSHsM+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V5 13/14] i3c: mipi-i3c-hci: Factor out i3c_hci_sysdev()
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, linux-pci@vger.kernel.org
In-Reply-To: <20260807145638.168865-14-adrian.hunter@intel.com>
References: <20260807145638.168865-1-adrian.hunter@intel.com>
 <20260807145638.168865-14-adrian.hunter@intel.com>
Date: Fri, 07 Aug 2026 15:40:33 +0000
Message-Id: <20260807154034.87BED1F000E9@smtp.kernel.org>
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

PiBUaGUgTUlQSSBJM0MgSENJIGRyaXZlciBuZWVkcyB0byBpZGVudGlmeSB0aGUgdW5kZXJseWlu
ZyBzeXN0ZW0gZGV2aWNlCj4gdXNlZCBmb3IgRE1BIG1hcHBpbmcgYW5kIFBNIG9wZXJhdGlvbnMu
IFRoZSBsb2dpYyBmb3IgZGV0ZXJtaW5pbmcgdGhhdAo+IGRldmljZSBpcyBjdXJyZW50bHkgZW1i
ZWRkZWQgaW4gdGhlIERNQSBpbXBsZW1lbnRhdGlvbi4KPiAKPiBGYWN0b3IgdGhpcyBjb2RlIG91
dCBpbnRvIGkzY19oY2lfc3lzZGV2KCkgc28gaXQgY2FuIGJlIHNoYXJlZCBieSBvdGhlcgo+IHBh
cnRzIG9mIHRoZSBkcml2ZXIgYW5kIGtlZXAgdGhlIGRldmljZS1zZWxlY3Rpb24gbG9naWMgaW4g
b25lIHBsYWNlLgo+IAo+IFRoZSBleHBsYW5hdG9yeSBjb21tZW50IG1vdmVzIHdpdGggdGhlIGNv
ZGUsIHJld29ya2VkIGFzIGtlcm5lbC1kb2Mgbm93Cj4gdGhhdCBpdCBkb2N1bWVudHMgYSBmdW5j
dGlvbiByYXRoZXIgdGhhbiBhbiBpbmxpbmUgYmxvY2suCj4gCj4gU2lnbmVkLW9mZi1ieTogQWRy
aWFuIEh1bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+CgpTYXNoaWtvIGhhcyByZXZpZXdl
ZCB0aGlzIHBhdGNoIGFuZCBmb3VuZCBubyBpc3N1ZXMuIEl0IGxvb2tzIGdyZWF0IQoKLS0gClNh
c2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDgw
NzE0NTYzOC4xNjg4NjUtMS1hZHJpYW4uaHVudGVyQGludGVsLmNvbT9wYXJ0PTEzCgoKLS0gCmxp
bnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
