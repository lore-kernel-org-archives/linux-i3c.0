Return-Path: <SRS0=Fyq7=NH=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D79C4338F
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Aug 2021 06:52:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1B0161A6E
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Aug 2021 06:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1B0161A6E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Uzjeml7qjt4e+plXMoR8SyA4iEUSEXRVUXYguCne28=; b=oS9W3nhtPeVKxy
	KUI3NlEl9vc502llmaFvTR+ADsU+E4NrxncfGILSMZ0ctIy1txutjQ2X39+CRIlzaQAnN+E0JQvC+
	VWuqDEETcRaPwjul/tFX8MkjenL9JJsKpst45D4+S0LLhvdz1zzRmawSq6eBQEzEtZ5Xh1P2uiLaQ
	wHPYMsaGoBQCbKZCup0dffDQaWW+Ne7XQ3mtuHvwxpU1APjmoOZnpUmnzw2+1fZgUq1Z7faB9vSWU
	qSg+IcFSaBlEu9GumVI06yAXNJGgQN8NCnpwRJPbaca5qBeKpfaYSSZVCh45SrvlznyuEQe3jXaE2
	9rOlvQ4P8d2gdctWdnNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFWUF-00GIwc-Ug; Mon, 16 Aug 2021 06:52:43 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFWUC-00GItK-Pw
 for linux-i3c@lists.infradead.org; Mon, 16 Aug 2021 06:52:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 211171BF209;
 Mon, 16 Aug 2021 06:52:33 +0000 (UTC)
Date: Mon, 16 Aug 2021 08:52:32 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Clark Wang <xiaoning.wang@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-imx@nxp.com
Subject: Re: [PATCH V4 3/8] i3c: master: svc: separate err, fifo and disable
 interrupt of reset function
Message-ID: <20210816085232.46682b0e@xps13>
In-Reply-To: <20210809063645.2289988-4-xiaoning.wang@nxp.com>
References: <20210809063645.2289988-1-xiaoning.wang@nxp.com>
 <20210809063645.2289988-4-xiaoning.wang@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_235241_025401_92E9763E 
X-CRM114-Status: UNSURE (   7.06  )
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

SGkgQ2xhcmssCgpDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+IHdyb3RlIG9uIE1v
biwgIDkgQXVnIDIwMjEgMTQ6MzY6NDAKKzA4MDA6Cgo+IFNvbWV0aW1lcyBvbmx5IG5lZWQgdG8g
cmVzZXQgZXJyIGFuZCBmaWZvIHJlZ3MsIHNvIHNwbGl0IHRoZSBvcmlnaW4KPiByZXNldCBmdW5j
dGlvbiB0byB0aHJlZSBmdW5jdGlvbnMuCj4gUHV0IHRoZW0gYXQgdGhlIHRvcCBvZiB0aGUgZmls
ZSwgdG8gbGV0IG1vcmUgZnVuY3Rpb25zIGNhbiBjYWxsIHRoZW0uCj4gCj4gU2lnbmVkLW9mZi1i
eTogQ2xhcmsgV2FuZyA8eGlhb25pbmcud2FuZ0BueHAuY29tPgo+IFJldmlld2VkLWJ5OiBKdW4g
TGkgPGp1bi5saUBueHAuY29tPgoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1pM2MgbWFpbGlu
ZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
