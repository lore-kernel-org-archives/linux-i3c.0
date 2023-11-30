Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF71C07CA9
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Nov 2023 19:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7uIfIHDZxTSy0P5e+ynbUwCNwzrnZQezfUv3nLdyPxQ=; b=fOjU737sFNU347
	Tm57uxxX6WqTvbJpIoLt0dBXQUiIBVznnTkJp8kSzuKfnPXnhdlNtHP5lT+DErye6RlgsxERVHAyd
	YmR2QIqFXJbFt6LF8zdGBQgRY7ueJ3YSwkCmC6BHV64E8DV1OewUyHnEGj6LWdYJ2I5HL0n3vSYAI
	4OvE16w4cCS8T5ySfzi4dKcXNraYMNDiz8k1qgw3MFwhE0DnGaBO8Svs6bnZ8wCFnlCVZIEtRVhus
	OY9kMyJBi+qiXJOqoe0HzLZslE5A0RLoo39Mnsz6exK4Bcrcz8X54Z2FQaciOemfs+BVBk2bVU3ru
	983yta/15MLyD1UbE14A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8mWG-00Bhnp-0e;
	Thu, 30 Nov 2023 19:16:16 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8mWD-00Bhm8-0q
	for linux-i3c@lists.infradead.org;
	Thu, 30 Nov 2023 19:16:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 109F01C0003;
	Thu, 30 Nov 2023 19:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701371766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mE9/tLP0eyYG3y00nEhJnVDwOaisqMrxBjBW9/Ybvm0=;
	b=DM6ceKIhBV6tIWBT1O5ejGiMHISZq82LwOsjaEZcszhe+L61E5vrnfgwaLv1tTDKpVarRP
	lQfaK3Dz/6iem1wLq2aORwPTg9BRG0gRkygmx97qDxoaDFuHBkSVaFlMB13DtRZeMsiRXV
	RM5qHfvJrT5U9ABu2DxecrN+isoBUJpNuPKwHQmyQFYR6YuURpD5KlwGVNuSvPA+/Rs3G8
	MsaCKdBURif4juKKYVGjk50hqlCmcEkhFq4pJnDV3CdTj5N49BO6dCBDetH6BTOvhSGVgZ
	Hj1MffyQ1K9Ntf49cvTRlmc+on0RYu8MlplBKwSpXFdKXrnAIyDgGvPiS4sHzw==
Date: Thu, 30 Nov 2023 20:16:02 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, zbigniew.lukwinski@linux.intel.com
Subject: Re: [PATCH v4 6/6] i3c: add API i3c_dev_gettstatus_format1() to get
 target device status
Message-ID: <20231130201602.2944cc9f@xps-13>
In-Reply-To: <ZWjLMNKJElPI6uSo@lizhi-Precision-Tower-5810>
References: <20231129221225.387952-1-Frank.Li@nxp.com>
	<20231129221225.387952-7-Frank.Li@nxp.com>
	<20231130111959.11afd8a8@xps-13>
	<ZWjLMNKJElPI6uSo@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_111613_438436_C0891C42 
X-CRM114-Status: GOOD (  10.51  )
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

SGkgRnJhbmssCgo+ID4gPiArCj4gPiA+ICsJaWYgKCFzdGF0dXMpCj4gPiA+ICsJCXJldHVybiAt
RUlOVkFMOwo+ID4gPiArCj4gPiA+ICsJaTNjX2J1c19ub3JtYWx1c2VfbG9jayhkZXYtPmJ1cyk7
Cj4gPiA+ICsJaWYgKGRldi0+ZGVzYykKPiA+ID4gKwkJcmV0ID0gaTNjX2Rldl9nZXRzdGF0dXNf
Zm9ybWF0MV9sb2NrZWQoZGV2LT5kZXNjLCBzdGF0dXMpOwo+ID4gPiArCj4gPiA+ICsJaTNjX2J1
c19ub3JtYWx1c2VfdW5sb2NrKGRldi0+YnVzKTsKPiA+ID4gKwo+ID4gPiArCXJldHVybiByZXQ7
Cj4gPiA+ICt9Cj4gPiA+ICtFWFBPUlRfU1lNQk9MX0dQTChpM2NfZGV2aWNlX2dldHN0YXR1c19m
b3JtYXQxKTsgIAo+ID4gCj4gPiBUaGVyZSBpcyBubyB1c2VyIHlldC4gTWF5YmUgdGhpcyBuZWVk
cyB0byBiZSBkb25lIGluIGFub3RoZXIgc2VyaWVzPwo+ID4gU2FtZSBiZWxvdy4gIAo+IAo+IFNl
ZQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2lteC8yMDIzMTEwNzAzMzAuNW15bGF1TFItbGtw
QGludGVsLmNvbS9ULyN0CgpUaGVuIHRoaXMgcGF0Y2ggc2hvdWxkIGJlIHBhcnQgb2YgdGhlIHNl
cmllcyB5b3UgbWVudGlvbi4KClRoYW5rcywKTWlxdcOobAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5n
IGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
