Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D982FCD98CF
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 10:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mqqN4eFIC7BdyrTJGPOeq9EbRtzqnzsIWZiIXGT4szE=; b=tNXyEj92wG58Bv
	IiXuSAIb2tLDhX9vJh+odjg8TBmP6I4VP5joKcuP/6RO1PSjrvDDU8sIQuR0B/0atC3L+4xrUWzMr
	wkzV6twoWrk07q2UDQfk68Ycsj7QJKW5x4ZUd4C8d8ZlCuTpCRJLAULj28mZOaq/GsI6OGmslhup1
	JEOKzLH6NTlDlJREnKMaKpjtdj7Ova9Gfbo8rIg3c3K3Rbgx0zFAxZFCvJquWkybtSVsNhtfmmEC1
	SBnGlBpatDPXn1+NbcFnnj90YhI8ejWMnQYEaTKjYoC8Pzq/lntO9YMF6Nt2ofOBnGUs7npMtccwA
	afn/IYRm53Cx+Aa4oyhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQeM-0000000FZ7l-2bOv;
	Tue, 16 Jun 2026 10:04:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQeM-0000000FZ7d-03K2
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 10:04:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6761A4076C;
	Tue, 16 Jun 2026 10:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08FA61F000E9;
	Tue, 16 Jun 2026 10:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781604245;
	bh=HEwFa4w2a6Mj+KrVCMuA+0moVF/uSWn8wowviak+yEY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fK3meKxRlXccqFHiTx9Z3XHvQzdmjZikrv9MPYV18xiAWoyyeO7tkhTCtuF5sGmm0
	 jrb0H2KK5COGkAzTCMf7CdFyj/ZBqQMuL3l2DuZ1RPSwWygRmBOlV6OSTxkhll2nFr
	 nBws/ox8QVELXsYstqXeUKjr2p39oN3uFsy4wePanpnxMgDEdfGC71/IOxE+d+6NZs
	 KQWE7s68LzcOHeHP1CnPFVCvyqaLbusxyXJ0Mid1v7dMoNv4gdwl5GTC6Z2tLmiTlL
	 PMo4IreofWajiOSn9kuTh79B6D2V9+1oXgfeREA4OVv9+TUKvRmYm7cfHre2/VQYnI
	 zTjB4uLtoH/dQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/12] dt-bindings: i3c: Add mipi-i3c-static-method
 to support SETAASA
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260616095429.3947205-2-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-2-akhilrajeev@nvidia.com>
Date: Tue, 16 Jun 2026 10:04:04 +0000
Message-Id: <20260616100405.08FA61F000E9@smtp.kernel.org>
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

PiBBZGQgdGhlICdtaXBpLWkzYy1zdGF0aWMtbWV0aG9kJyBwcm9wZXJ0eSBtZW50aW9uZWQgaW4g
dGhlIE1JUEkgSTNDCj4gRGlzY292ZXJ5IGFuZCBDb25maWd1cmF0aW9uIFNwZWNpZmljYXRpb24g
WzFdIHRvIHNwZWNpZnkgd2hpY2ggZGlzY292ZXJ5Cj4gbWV0aG9kIGFuIEkzQyBkZXZpY2Ugc3Vw
cG9ydHMgZHVyaW5nIGJ1cyBpbml0aWFsaXphdGlvbi4gVGhlIHByb3BlcnR5IGlzCj4gYSBiaXRt
YXAsIHdoZXJlIGEgYml0IHZhbHVlIG9mIDEgaW5kaWNhdGVzIHN1cHBvcnQgZm9yIHRoYXQgbWV0
aG9kLCBhbmQgMAo+IGluZGljYXRlcyBsYWNrIG9mIHN1cHBvcnQuCj4gCj4gQml0IDA6IFNFVERB
U0EgQ0NDIChEaXJlY3QpCj4gQml0IDE6IFNFVEFBU0EgQ0NDIChCcm9hZGNhc3QpCj4gQml0IDI6
IE90aGVyIENDQyAodmVuZG9yIC8gc3RhbmRhcmRzIGV4dGVuc2lvbikKPiBBbGwgb3RoZXIgYml0
cyBhcmUgcmVzZXJ2ZWQuCj4gCj4gSXQgaXMgc3BlY2lmaWNhbGx5IG5lZWRlZCB3aGVuIGFuIEkz
QyBkZXZpY2UgcmVxdWlyZXMgU0VUQUFTQSBmb3IgdGhlCj4gYWRkcmVzcyBhc3NpZ25tZW50LiBT
RVREQVNBIHdpbGwgYmUgc3VwcG9ydGVkIGJ5IGRlZmF1bHQgaWYgdGhpcyBwcm9wZXJ0eQo+IGlz
IGFic2VudCwgd2hpY2ggbWVhbnMgZm9yIG5vdyB0aGUgcHJvcGVydHkganVzdCBzZXJ2ZXMgYXMg
YSBmbGFnIHRvCj4gZW5hYmxlIFNFVEFBU0EsIGJ1dCBrZWVwIHRoZSBwcm9wZXJ0eSBhcyBhIGJp
dG1hcCB0byBhbGlnbiB3aXRoIHRoZQo+IHNwZWNpZmljYXRpb25zLgo+IAo+IFsxXSBodHRwczov
L3d3dy5taXBpLm9yZy9taXBpLWRpc2NvLWZvci1pM2MtZG93bmxvYWQKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBBa2hpbCBSIDxha2hpbHJhamVldkBudmlkaWEuY29tPgoKU2FzaGlrbyBoYXMgcmV2aWV3
ZWQgdGhpcyBwYXRjaCBhbmQgZm91bmQgbm8gaXNzdWVzLiBJdCBsb29rcyBncmVhdCEKCi0tIApT
YXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA2
MTYwOTU0MjkuMzk0NzIwNS0xLWFraGlscmFqZWV2QG52aWRpYS5jb20/cGFydD0xCgoKLS0gCmxp
bnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
