Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F21C4167B
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Nov 2023 10:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2A2eKhUv/ILAqQzKTtIqpjv96nU+Uyr5m/upiKLMSi8=; b=DIxBAQmlXPv19n
	4pkpHjuobiVKxdSJPd+IsXnRT9D5qHTvpGkCboWh4WRZ4Xde2QLetpWn0g7ZFe3q1U3yAYRIALJ1J
	w+RMcamvOh8Oi8ANUR9gfNknZAtHw5SEpL7jxccYWzBo+2gxsc4pKkalSh+4TFKR6SnnZPk+4CMuR
	wcxZ+7HX0+dnMJArYiRuAm7xCGeiFDuNlS1LTEDTIknC/al4IKOymNeAea9KyUlOlVq/7x92c5Szb
	KvLcYx734Z8otgV/Lo6pilFxeFYbnjLRjXKxjBtTmdk6u/2dMFYKvky2cD3+QDlEvpuNRPpOyranE
	ahoiOoYenBijYNPP2h6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8e6k-00AQBV-2c;
	Thu, 30 Nov 2023 10:17:22 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8e6i-00AQAh-2W
	for linux-i3c@lists.infradead.org;
	Thu, 30 Nov 2023 10:17:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2FE4EFF80F;
	Thu, 30 Nov 2023 10:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701339436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wbfoor/K42HcFZmg+FPYUl7SQccR75WTDfEvqXRzmjI=;
	b=fTuwUGXKtMGJI+ONtelQaDLx5QvoQtmC2cHVCbuWSlmVnscbOQfgqas9yyPsxot9afZhJi
	4VTwJxuIrwizHZyieFoZa/cNFeO/lNJhKOCANrc5JVUmnbZQu/2vpk94s1Aw5FREVnfBf5
	6NBmht5rtizrlFHouxGxqr9c4i/WC9RX+a60Xv7GHH4H7Olj2+5B8QPZxHXflh0EMwjE03
	sDstrn6gaH7sn3cHjOnmsKAu218FDfxs4GFWxNnLIHjLoBJ6L8ScBmlgfWqRNPhvSNdXbl
	0xJrseDvDfigWZMRHUH21LuuXFsPlSVOF42fjJrbEkZgWFw6VRihDkrgB4LGVg==
Date: Thu, 30 Nov 2023 11:17:12 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, zbigniew.lukwinski@linux.intel.com
Subject: Re: [PATCH v4 3/6] i3c: add actual_len in i3c_priv_xfer
Message-ID: <20231130111712.6438de35@xps-13>
In-Reply-To: <20231129221225.387952-4-Frank.Li@nxp.com>
References: <20231129221225.387952-1-Frank.Li@nxp.com>
	<20231129221225.387952-4-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_021720_981740_8F8A42EE 
X-CRM114-Status: UNSURE (   8.79  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIFdlZCwgMjkgTm92IDIwMjMgMTc6
MTI6MjIgLTA1MDA6Cgo+IEluIE1JUEkgSTNDIFNwZWNpZmljYXRpb246Cj4gCj4gIk5pbnRoIEJp
dCBvZiBTRFIgVGFyZ2V0IFJldHVybmVkIChSZWFkKSBEYXRhIGFzIEVuZC1vZi1EYXRhOiBJbiBJ
MkMsIHRoZQo+IG5pbnRoIERhdGEgYml0IGZyb20gVGFyZ2V0IHRvIENvbnRyb2xsZXIgaXMgYW4g
QUNLIGJ5IHRoZSBDb250cm9sbGVyLiBCeQo+IGNvbnRyYXN0LCBpbiBJM0MgdGhpcyBiaXQgYWxs
b3dzIHRoZSBUYXJnZXQgdG8gZW5kIGEgUmVhZCwgYW5kIGFsbG93cyB0aGUKPiBDb250cm9sbGVy
IHRvIEFib3J0IGEgUmVhZC4gSW4gU0RSIHRlcm1zLCB0aGUgbmludGggYml0IG9mIFJlYWQgZGF0
YSBpcwo+IHJlZmVycmVkIHRvIGFzIHRoZSBULUJpdCAoZm9yIOKAmFRyYW5zaXRpb27igJkpIgo+
IAo+IEkzQyBhbGxvdyBkZXZpY2VzIGVhcmx5IHRlcm1pbmF0ZSBkYXRhIHRyYW5zZmVyLiBTbyBu
ZWVkICJhY3R1YWxfbGVuIiBmaWVsZAo+IHRvIGluZGljYXRlIGhvdyBtdWNoIGdldCBieSBpM2Nf
cHJpdl94ZmVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29t
PgoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+
CgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtaTNjCg==
