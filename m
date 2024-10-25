Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3743D11718
	for <linux-i3c@archiver.kernel.org>; Fri, 25 Oct 2024 07:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vif3rmDhW46wBjDPVT35dr8ohnQjzPrja7bSwjyAruc=; b=xuwW9v9yZwY9qk
	mfMPTYkWRY21VKFMlWij5WV7E+2rnSvFQcANEknPACz4jB+eCAHAcj0+qeE4vv2HUFoQsjAe0pglA
	2PKWHpySIRygSI1tC9ivOSrPmkKCIS5IMXSfBy/g4SFP5uC3/K/g6yeAwX8tyiV92D26E5KRWkU+o
	fvF1y9vMYZupZrQqlBMfy/ItQjh8gbBhTSWsKu3vLzyFxvAaT/lKa5EJZK5ewGhzXHEU2aQh0ybMq
	+UeS1C3+xMkYq7ATlizQaKKGXMlTH7/Xdx1oWD9vCh0ayX3CIUPepsuap11fiOJyV9WuyyN+0PT8P
	jOS1DO2ePyfkMHGWPe0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FA1-00000002s2L-0ZCS;
	Fri, 25 Oct 2024 07:55:05 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4F8L-00000002rkP-2ovX
	for linux-i3c@lists.infradead.org;
	Fri, 25 Oct 2024 07:53:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0915FE000A;
	Fri, 25 Oct 2024 07:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729842799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=40gzCCCrme78XnXow8uMr43mimnWIXjTPd1lXyTSI+U=;
	b=IuCzne0Fr3k0KaXrKhpVRMZVA1u6pTHH9Am/Wm0n59VP/F2yx2O8IKisftSqHdeMKul+OL
	LzlmcJvDa0eXXJsAjhnKPfCKTzLV2FESm92bMfSHgTPllJLbgUShjXHaSeI+hSsVImsIgV
	Gx+aMJqgATor5HN6VOBIQS6TWpFRMLt+ezca5yea4f8alOciSTrUMvJaJ2uy4N2ASU+K+9
	2G3cMfLrJzocnWsr1GAtFEyjTsGz+N1p2n1GRIL89X6l7xNxSLiANbiA95q+6bwIePF/pa
	UJ+jIOdGhowjUsvO58Z3z8KK1mqDP8dW+wH8dK2HdzKwxcvaQQF8ZkfVwqlBsQ==
Date: Fri, 25 Oct 2024 09:53:18 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Clark Wang <xiaoning.wang@nxp.com>,
 linux-i3c@lists.infradead.org (moderated list:SILVACO I3C DUAL-ROLE
 MASTER), linux-kernel@vger.kernel.org (open list), imx@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: master: svc: Modify enabled_events bit 7:0 to
 act as IBI enable counter
Message-ID: <20241025095318.4785df2c@xps-13>
In-Reply-To: <20241024203855.1584416-1-Frank.Li@nxp.com>
References: <20241024203855.1584416-1-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_005321_878025_52322778 
X-CRM114-Status: UNSURE (   6.79  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIFRodSwgMjQgT2N0IDIwMjQgMTY6
Mzg6NTUgLTA0MDA6Cgo+IEZpeCBpc3N1ZSB3aGVyZSBkaXNhYmxpbmcgSUJJIG9uIG9uZSBkZXZp
Y2UgZGlzYWJsZXMgdGhlIGVudGlyZSBJQkkKPiBpbnRlcnJ1cHQuIE1vZGlmeSBiaXQgNzowIG9m
IGVuYWJsZWRfZXZlbnRzIHRvIHNlcnZlIGFzIGFuIElCSSBlbmFibGUKCklzIHRoaXMgYml0Zmll
bGQgYXJiaXRyYXJ5PwoKSXMgdGhlcmUgYSByYXRpb25hbGUgYmVoaW5kIGl0PwoKPiBjb3VudGVy
LCBlbnN1cmluZyB0aGF0IHRoZSBzeXN0ZW0gSUJJIGludGVycnVwdCBpcyBkaXNhYmxlZCBvbmx5
IHdoZW4gYWxsCj4gSTNDIGRldmljZXMgaGF2ZSBJQkkgZGlzYWJsZWQuCj4gCj4gQ2M6IHN0YWJs
ZUBrZXJuZWwub3JnCj4gRml4ZXM6IDdmZjczMGNhNDU4ZSAoImkzYzogbWFzdGVyOiBzdmM6IGVu
YWJsZSB0aGUgaW50ZXJydXB0IGluIHRoZSBlbmFibGUgaWJpIGZ1bmN0aW9uIikKPiBTaWduZWQt
b2ZmLWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4KCkFueXdheSwKClJldmlld2VkLWJ5
OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzLApNaXF1
w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkz
Ywo=
