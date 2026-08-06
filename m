Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE736C56208
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 13:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/RpNGJrHSuq8Z/NLLAampA/Bvd1OA+PpRjieIg5Uoo4=; b=iCyQj/xJPaQ6J+
	nJp0hSMOxbomaXScl6/Hj7UUP3iy+AWe8ZNMmOKR6f9Fr8kNs5M0matXzMPOF9iRCWhHZKqshG46s
	RKLOBO0t3PBvJgQITLY2zeqVjUfBvdcGY8JbNAVJu78pHs1jaPHFBZju/6iVF4UuEbNDnWfRtx1P/
	VgJx7zFVGQntnNTIAkuE9Xldi41jfcr2nsmjLMFl8l6MOLY8g1NY/PYG3DpNTfQlQQF+0CoxX/4aA
	pU+Lxz1wi5S/W5B1wXmVCO8GfJR8rCitpO+e/oiGBOKNcTpTepoqwubwDNSBGLCyi4atS05hO627O
	NXwMNplr5nn+V/IO4riQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryQb-00000005vtj-1wul;
	Thu, 06 Aug 2026 13:46:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryQa-00000005vtT-0FVQ
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 13:46:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BA19C438BB;
	Thu,  6 Aug 2026 13:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CBD91F000E9;
	Thu,  6 Aug 2026 13:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786023991;
	bh=p3Qd/1e4v9FWB9rkPTLag/DXeEWXbqVoT/g7Q4Da9EU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E48PnlpFwDfQFHtdIj/WRt0gINqiyz+hqPUBSxwj33Olno5myw9d3SdVhPVQ0Visi
	 SPzac9bAEU9b48IFARrpJyqapR2wxGzPGcpcYmvOwMcHJ3CceGIX0lkiajYBdDFIj2
	 d/0nrves0hoGcc+lfXVRr220Y0V/VJxkOq7lNXSmoxWj432/+uxSc1WfXe1HUmu0R0
	 622TZ9sk3JJJa7owLYFpbGb2DUfd9XySIUrPrdUS0Ke8Xguc2/OfAMuUr+twXb0Prg
	 xYef5nReAMw/V9n7oESE+na32SY5XQgtCSST5UBfSCqXnZBjwcNI1JGfQtrpKPRvN4
	 KO2wmbcq5BaYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 13/14] i3c: mipi-i3c-hci: Factor out i3c_hci_sysdev()
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-pci@vger.kernel.org
In-Reply-To: <20260806131857.119830-14-adrian.hunter@intel.com>
References: <20260806131857.119830-1-adrian.hunter@intel.com>
 <20260806131857.119830-14-adrian.hunter@intel.com>
Date: Thu, 06 Aug 2026 13:46:30 +0000
Message-Id: <20260806134631.5CBD91F000E9@smtp.kernel.org>
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
NjEzMTg1Ny4xMTk4MzAtMS1hZHJpYW4uaHVudGVyQGludGVsLmNvbT9wYXJ0PTEzCgoKLS0gCmxp
bnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
