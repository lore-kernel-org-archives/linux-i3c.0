Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5F6E75433
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Oct 2023 08:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KeTNGKuWpHO4pqsRncxB/nwjhcAYs8N9L1w2KrG5Fpw=; b=aGsbvrfhftVknH
	uQDuoJD+AWdzpNAFAZIaljamMcTVo1zxxPUvgNkRIXOnJylLfIGXJrCTQ/6zWS9A/hZ4MxsPucXli
	RJ0qtbr4vEzXuehOmYmT9cUNe967wJdni2ohyBydPUxSj9VXaGtl4gIbfQGOW4LHlTsf9UU8NRfMm
	dP1M+HM3pl2e+92qKDPjOerbICDEgvco3vj81tuCSdEthThH6AVyX5t2bhtIPawPSKdqDu4a/vCIA
	fdEWVr3FeRRUrrL8lU8jGL9BMyUl+Vc/sZkoFmZMximq6EXsvi2QOOqKlxp+FGgA9Qs1olVpPXKks
	XNfUh31L03ePDIhwDMzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnagn-00E8rK-0B;
	Tue, 03 Oct 2023 08:23:33 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnagj-00E8pF-2h
	for linux-i3c@lists.infradead.org;
	Tue, 03 Oct 2023 08:23:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D8551C0007;
	Tue,  3 Oct 2023 08:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696321403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jSGcSwAqUefKWmuimG5WT5sO8MU51Z7G0dHxsNTfhXM=;
	b=J8fnA1o8wn6xc0cQOA4aHjVfrhDtatLI15AwEqfkCmRZNmwQ+SHktd6U38GrZplOOvBKpH
	fD+SKVGxi/4rLFf/e/ygsfGdY5r5+ydbBux0xZ8mdWK9PGWMeQzi3ufBKF6+iaZFr2juwf
	aFU1xDdhouV1o6Ijw+N4gHhnr5aDP00flyo40GH778kB5EpZCnryuajnGo+LXYyrE6EVk5
	/keLPFJcVPRpQy+gnlc/KKYbSGddlJBTexnXDhX8tPBbM/qQGpIFapuAIdRwxObCbSdMqP
	GVYJbYQFlLV72qnt3FVo1nHt0CmDIBEM7lAmYs5W9Dndp4bEe11Nsd0IJA3CMw==
Date: Tue, 3 Oct 2023 10:23:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Matt Johnston <matt@codeconstruct.com.au>
Cc: linux-i3c@lists.infradead.org, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Conor Culhane
 <conor.culhane@silvaco.com>, linux-kernel@vger.kernel.org (open list),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS), linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: Re: [PATCH] i3c: Fix typo "Provisional ID" to "Provisioned ID"
Message-ID: <20231003102319.77fdf512@xps-13>
In-Reply-To: <20231003075339.197099-1-matt@codeconstruct.com.au>
References: <20231003075339.197099-1-matt@codeconstruct.com.au>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_012330_154743_C9A9EDBF 
X-CRM114-Status: UNSURE (   7.18  )
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

SGkgTWF0dCwKCm1hdHRAY29kZWNvbnN0cnVjdC5jb20uYXUgd3JvdGUgb24gVHVlLCAgMyBPY3Qg
MjAyMyAxNTo1MzozOSArMDgwMDoKCj4gVGhlIE1JUEkgSTNDIHNwZWMgcmVmZXJzIHRvIGEgUHJv
dmlzaW9uZWQgSUQsIHNpbmNlIGl0IGlzIChzb21ldGltZXMpCj4gcHJvdmlzaW9uZWQgYXQgZGV2
aWNlIG1hbnVmYWN0dXJpbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF0dCBKb2huc3RvbiA8bWF0
dEBjb2RlY29uc3RydWN0LmNvbS5hdT4KClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1
ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1h
aWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
