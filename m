Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA903C77B75
	for <linux-i3c@archiver.kernel.org>; Mon, 22 May 2023 08:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6+JihDrbXGPjxsQefqW5r63sxYLTvyoTTHpjv95NDfE=; b=jDvDOXLSV9m91X
	WB3havYMOlQxeTJ5jFqPU9C76yOWSDN+iCp7vIN32Hkkgxhp99DpUEaEOBEWz02n/tEkV7c9+4VEX
	5+y8oOtL5cH14atIJ56gY49yn1JBED3d9ckdae1AXGgK1/PBoTAXnPDoOWJiFCFZYjgeEwGWndADl
	Fl6oFsWrymIgQ2aQM0pL1NBW8R8b1KVUFitHaJO9FeAU9WaLC31zGzZcH6LHEXyp7Cx5gK7JCh2no
	8LYZurhhMQlf5LdS1TQp2+hv+CetCEpJLDOrQLkWHih1cJDFOC/14iRLNpMgUPStK088kuLvO9a5b
	4Y28tj7AYXjaSvTAE7tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q10xe-005l1a-0B;
	Mon, 22 May 2023 08:32:10 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q10xY-005kzq-1f
	for linux-i3c@lists.infradead.org;
	Mon, 22 May 2023 08:32:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 286326000E;
	Mon, 22 May 2023 08:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684744320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9nA+yCnDD+jGhOJLKYTP39879FYeAa+yLpi/+lBJP00=;
	b=M8brq2KG5LVLd/nmRiduJj+MxtYR2sEYsKOlV2bS9D+idgLdJPi/mcdyAkgoWFZUSbTp4B
	TpGUQlC8uXHNTUSmVvF2Bzj96QStKnsKleQNeP5jBxGhCJRI2A19fDkyACFvLihNB1hRPe
	cKQVG0+BF6w4uxoMquzGGnUEDN6H/OIvNFsVOBs+5Ic0v3ma5+59zmj9lAL2Re/FqrmMTK
	8F10dAJcN2bGRTrP5bOXGbKJvpnL/qGlk/92TRP8ILJkgvK635VZ4X5cAIfmAN11pj00fx
	lBo1HOeHEoH24PmQjVslJDE1dFpVaff76YchKM0lgF/DyEyhQ8Zd6F/iJC6A+Q==
Date: Mon, 22 May 2023 10:31:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Clark Wang <xiaoning.wang@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: svc: fix i3c suspend/resume issue
Message-ID: <20230522103158.016ae674@xps-13>
In-Reply-To: <20230517033030.3068085-1-xiaoning.wang@nxp.com>
References: <20230517033030.3068085-1-xiaoning.wang@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_013204_705172_A8953DE7 
X-CRM114-Status: UNSURE (   7.13  )
X-CRM114-Notice: Please train this message.
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

SGkgQ2xhcmssCgp4aWFvbmluZy53YW5nQG54cC5jb20gd3JvdGUgb24gV2VkLCAxNyBNYXkgMjAy
MyAxMTozMDoyOCArMDgwMDoKCj4gV2hlbiBzeXN0ZW0gc3VzcGVuZHMsIGlmIGkzYyBtb2R1bGUg
aXMgcG93ZXJlZCBkb3duLCByZWdpc3Rlcgo+IHZhbHVlIHdpbGwgbG9zZS4KPiBOZWVkIHRvIHNh
dmUgdGhlIGtleSByZWdpc3RlcnMgYmVmb3JlIHN5c3RlbSBzdXNwZW5kLgo+IFNvIHNhdmUgdGhl
c2UgcmVnaXN0ZXJzIHZhbHVlIGluIHJ1bnRpbWUgcG0gc3VzcGVuZCwgYW5kIHJlc3RvcmUgdGhl
bQo+IGlmIHRoZXNlIHJlZ2lzdGVyJ3MgdmFsdWUgaXMgZGlmZmVyZW50IHdpdGggdGhlIHNhdmVk
IHZhbHVlcwo+IHdoZW4gcnVudGltZSBwbSByZXN1bWUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2xh
cmsgV2FuZyA8eGlhb25pbmcud2FuZ0BueHAuY29tPgoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXlu
YWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51
eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
