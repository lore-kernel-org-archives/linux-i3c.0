Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE01C4345F
	for <linux-i3c@archiver.kernel.org>; Mon,  6 May 2024 08:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h8TgTxNNZijCdwuWgfgBO74y7e9xqhFTWlkD5G1s7yU=; b=pZOiy/nUIox/l7
	drXuPJe91XJyxzOdw0XG7J1fi4D/NtcCtdZqmH32E5HnOYxPMr2N4zjCDyW/CagcN8Q8FwUmF7X1p
	naK/2QxEo9X2LVwsAmmK+ECEPKBo0jPc3W/RhOFr4lGg/LB6Ha5nwwIfO6uInFVCp8nUbRchUzJwe
	XI+g5cith0YDYpqie16uuEm1gGVNWlEQY7UEB8mbCdKlySZa/0IRw/FDLu04225IngYhVecJfcrNU
	deriZcgnJd5ByrEIEIos5DJFU92Vzi7RXTrthJ1x9SGmnoNvxivJx4sJwMSoH5f9pXlmk/jBFQeVI
	/tarks9YNFQtPGFE1GxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3u7g-00000006iJ7-2lX8;
	Mon, 06 May 2024 08:55:00 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3u7d-00000006iI6-2NJP
	for linux-i3c@lists.infradead.org;
	Mon, 06 May 2024 08:54:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80946C0015;
	Mon,  6 May 2024 08:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714985693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YXrjSateGikcCPRPsOAFErk3+6M1AzwYZKnymVg6nJw=;
	b=ApPpNERIDYb7v5HNNv2O3UmGLL3XrVpcmUG/KTbGeWUn0nSwFZ7Y1fOQG4eLDDMMLFXZjN
	IVNxqKtITNEsAIsD+5l1wCshGzNAszAec+sJVNetqbe/zDkUoR95xvspSzimcIBmE4AVX9
	bzBlCLmqpedbcg9BRsSLQ9G378ogtXYUTGg74IcaE5nsk/XIaDocF1jbTL+pwkbORC0/cB
	ci8mGZazK+SLG7XWnZsEMQarqfKQyNXGd3kHgCboKm/B0FNlxkSN37jt0vCU+qJnvfYCDC
	wVSkUHiUciz9ceslcnbEnu6PJanl0Int2TrGEnpGVpyqO+akReJJY/OyNKpSyQ==
Date: Mon, 6 May 2024 10:54:51 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org (moderated
 list:SILVACO I3C DUAL-ROLE MASTER), linux-kernel@vger.kernel.org (open
 list), imx@lists.linux.dev
Subject: Re: [PATCH 1/2] i3c: master: svc: change ENXIO to EAGAIN when IBI
 occurs during start frame
Message-ID: <20240506105451.26e40778@xps-13>
In-Reply-To: <20240424190030.857632-1-Frank.Li@nxp.com>
References: <20240424190030.857632-1-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_015457_841591_5EB58C45 
X-CRM114-Status: GOOD (  16.08  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIFdlZCwgMjQgQXByIDIwMjQgMTU6
MDA6MjkgLTA0MDA6Cgo+IHN2Y19pM2NfbWFzdGVyX3hmZXIoKSByZXR1cm5zIGVycm9yIEVOWElP
IGlmIGFuIEluLUJhbmQgSW50ZXJydXB0IChJQkkpCj4gb2NjdXJzIHdoZW4gdGhlIGhvc3Qgc3Rh
cnRzIHRoZSBmcmFtZS4KPiAKPiBDaGFuZ2UgZXJyb3IgY29kZSB0byBFQUdBSU4gdG8gaW5mb3Jt
IHRoZSBjbGllbnQgZHJpdmVyIHRoYXQgdGhpcwo+IHNpdHVhdGlvbiBoYXMgb2NjdXJyZWQgYW5k
IHRvIHRyeSBhZ2FpbiBzb21ldGltZSBsYXRlci4KClRoaXMgY2hhbmdlcyBzbGlnaHRseSB0aGUg
dXNlciBBUEksIGJ1dCBmZWVscyBsZWdpdGltYXRlIGF0IHRoZSBzYW1lCnRpbWUuIE1heWJlIGEg
Y29tbWVudCBzb21ld2hlcmUgaW4gdGhlIGkzYyBoZWFkZXJzIHRvIGNsYXJpZnkgdGhpcwpwb3Nz
aWJpbGl0eSBtaWdodCBiZSB3ZWxjb21lPwoKPiBGaXhlczogNWU1ZTNjOTJlNzQ4ICgiaTNjOiBt
YXN0ZXI6IHN2YzogZml4IHdyb25nIGRhdGEgcmV0dXJuIHdoZW4gSUJJIGhhcHBlbiBkdXJpbmcg
c3RhcnQgZnJhbWUiKQo+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyB8IDIgKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIGIvZHJpdmVycy9pM2Mv
bWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiBpbmRleCA1ZWU0ZGI2ODk4OGUyLi5hMjI5OGFiNDYw
YTM3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4g
KysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiBAQCAtMTA4MCw3ICsx
MDgwLDcgQEAgc3RhdGljIGludCBzdmNfaTNjX21hc3Rlcl94ZmVyKHN0cnVjdCBzdmNfaTNjX21h
c3RlciAqbWFzdGVyLAo+ICAJICogYW5kIHlpZWxkIHRoZSBhYm92ZSBldmVudHMgaGFuZGxlci4K
PiAgCSAqLwo+ICAJaWYgKFNWQ19JM0NfTVNUQVRVU19JQklXT04ocmVnKSkgewo+IC0JCXJldCA9
IC1FTlhJTzsKPiArCQlyZXQgPSAtRUFHQUlOOwo+ICAJCSphY3R1YWxfbGVuID0gMDsKPiAgCQln
b3RvIGVtaXRfc3RvcDsKPiAgCX0KCgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1pM2MgbWFp
bGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
