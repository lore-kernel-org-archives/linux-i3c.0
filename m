Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E50FC982D6
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Sep 2026 14:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=auhrCY0tAQJnkJN5wY1Vjr9v/hsYYSB/1VwZVqlV4GM=; b=WwmJt8IqMeMIat
	Dq26FxpIny89mV7TgrycCVEXW5ghgfxo30kLzrlagzVOVkR8Yzlqmw86kerXZbCmK4ciJUCDfvTjb
	GhWESMU3J9vTX8jWpAptgBq7a302n5P3TjEekENUHXeHwRWz/ibyQ0Eeas/+uF1bUYg7ATeciq6I0
	ekDJPCqdPT4/ZvfilSmQBxLOEiYeqc6VLIojI1lLtUhA68uitEjPvcCLgb3meW5YeFhJDniz2Dp82
	om5LxegpebKdqrMhvUK/cMBlEHyiyEKJTAsj2ZTwMN/UOkzOQtDjP8ZCghWIWCul9qfvMV0O/LS2v
	kYWLOXK7mhNAF7EMx+YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DSd-0000000Barj-0crS;
	Thu, 17 Sep 2026 14:51:39 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DSZ-0000000Bar5-0kbi
	for linux-i3c@lists.infradead.org;
	Thu, 17 Sep 2026 14:51:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E2D104E4079D;
	Thu, 17 Sep 2026 14:51:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B619F5FAA3;
	Thu, 17 Sep 2026 14:51:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4FCDE11C7B064;
	Thu, 17 Sep 2026 16:51:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789656687; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=POrtOuCOqjCiA6BJvL08zu5a4W1N+HThsgVOKIk8bsE=;
	b=xLt2syJCCOC0U58WArMxRSpRADdyj7imBISw9+zTCGs+KuD3U42mJG1sZ2OEQVxEolhlai
	dTJJBuPkxbkv5buRNTzAkq+iKw+VCBgy9rvw1/mhXBLWAUqKHLtds/ddxnh+PjmkWCMUlR
	mYCX9RC9JiJ/pJwwhMqYPVOYMdjQXZLV6du8x0CfboEiR2bwV2oJZeL/02EXKl23IZulLX
	8VOleOTKyd+ey+6qIgPvWyIbtt1n9IZtwW41wRF9O49oOX2F3qDcXeaDRnOQbtU3xL5CD4
	yWeUpSb91I0qmbRDJ+9Q92456G7NPOCuEDqWsGFKDC+QBYgrc4v+XFq8WGokSg==
Date: Thu, 17 Sep 2026 16:51:24 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: frank.li@nxp.com, miquel.raynal@bootlin.com,
	linux-i3c@lists.infradead.org,
	Stanley Chu <stanley.chuys@gmail.com>
Cc: linux-kernel@vger.kernel.org, tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v1] i3c: master: allocate IBI workqueue with WQ_HIGHPRI
Message-ID: <178965667891.3018556.16752833200317059806.b4-ty@b4>
References: <20260810013059.3055787-1-yschu@nuvoton.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260810013059.3055787-1-yschu@nuvoton.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_075135_380523_C088EA54 
X-CRM114-Status: UNSURE (   6.50  )
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

T24gTW9uLCAxMCBBdWcgMjAyNiAwOTozMDo1OSArMDgwMCwgU3RhbmxleSBDaHUgd3JvdGU6Cj4g
VGhlIElCSSAoSW4tQmFuZCBJbnRlcnJ1cHQpIHdvcmtxdWV1ZSBpcyBhbGxvY2F0ZWQgd2l0aCBv
bmx5Cj4gV1FfTUVNX1JFQ0xBSU0sIHdoaWNoIHBsYWNlcyBJQkkgcGF5bG9hZCBwcm9jZXNzaW5n
IGF0IG5vcm1hbAo+IHdvcmtlciBwcmlvcml0eS4gVGhpcyBpcyBpbmFkZXF1YXRlIGdpdmVuIHRo
ZSB0aW1lLXNlbnNpdGl2ZQo+IG5hdHVyZSBvZiBJQkkgaGFuZGxpbmcuCj4gCj4gSW4gdGhlIEkz
QyBwcm90b2NvbCwgd2hlbiBhIHRhcmdldCBhc3NlcnRzIGFuIElCSSwgdGhlIFNEQSBsaW5lCj4g
aXMgaGVsZCBsb3cgdW50aWwgdGhlIG1hc3RlciBhY2tub3dsZWRnZXMgYW5kIGNvbXBsZXRlcyB0
aGUKPiBleGNoYW5nZS4gVGhlIElSUSBoYW5kbGVyICh0b3AgaGFsZikgQUNLcyB0aGUgSUJJLCBy
ZWFkcyB0aGUKPiBwYXlsb2FkLCBlbWl0cyBhIFNUT1AsIGFuZCBpbW1lZGlhdGVseSBxdWV1ZXMg
dGhlIHBheWxvYWQKPiBwcm9jZXNzaW5nIHRvIHRoZSBwZXItZGV2aWNlIG9yZGVyZWQgd29ya3F1
ZXVlIHZpYQo+IGkzY19tYXN0ZXJfcXVldWVfaWJpKCkg4oCUIGVmZmVjdGl2ZWx5IHRoZSBib3R0
b20gaGFsZiBvZiB0aGUKPiBJQkkgaW50ZXJydXB0IHBhdGguCj4gCj4gWy4uLl0KCkFwcGxpZWQs
IHRoYW5rcyEKClsxLzFdIGkzYzogbWFzdGVyOiBhbGxvY2F0ZSBJQkkgd29ya3F1ZXVlIHdpdGgg
V1FfSElHSFBSSQogICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2kzYy9jLzU5MTk4MGFhYWE0
NgoKQmVzdCByZWdhcmRzLAoKLS0gCkFsZXhhbmRyZSBCZWxsb25pLCBjby1vd25lciBhbmQgQ09P
LCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9i
b290bGluLmNvbQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1pM2MK
