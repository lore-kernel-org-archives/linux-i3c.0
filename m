Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF6BC52D7C
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Aug 2024 15:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3tOTuP18uGO77PoCiMcOU/RD9QAd1brXUqUld8hrp00=; b=AsgUhrvBUKfnSU
	pdbgvBWADV8viCuWTw6q41RGsE9vXSZF9BsWeEVTWIkvPqy1zBaUHUwu6G0u+NM08HcaV9nZ7fMNl
	AXDJ1vSsp5D4aTjQMgP2ne+uCEsBHwIp5mxSY3YLw+t7VxoTm0Fkzg5vlzCrnTl/Kb/xLF5tauA2Q
	+t3rY2H0L1kgN+F87EU1Aqoji7KvRC03XWMvM/TQsIoZ0Adm4Yo0wStbYCWISmijYY5QJqWwwxjus
	UApzgW3Mw0oFWZgCpi1a9iFK4bVD0Xa6mR/MtaPUTOTJtZTl2enrLMsHA5E+tgOJsu4nm8MHnQTmX
	rOnC7y5c2tp4VOcctDuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWd2-0000000HPoJ-2w84;
	Fri, 23 Aug 2024 15:55:08 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWd0-0000000HPnK-0jya
	for linux-i3c@lists.infradead.org;
	Fri, 23 Aug 2024 15:55:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36BA31BF206;
	Fri, 23 Aug 2024 15:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724428503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eEz/6ePZ1I0F5z1Apuw2JYhplnq/t4tSEJ8r8Pg89tQ=;
	b=HOUepx49jzYoEeJeaYxdSRDvVYk7Zzht9GAHiqD/PYjeUVFT6BcPgyApLNRDcs49+kgWiF
	29EpFGsz2lay3DrnFGDBMhkPeBqysdzLLVhy1cqzNPRERT0kjfht5NGNK6nT4GmMhv7EXj
	sGm8EtGh42qvicnkqPNF2GBgPOKyPvBcdh+uqdr9sHcArb45C+Jz+M1wijKRaePLRQzmWA
	KHWlxIPXnMTFxzjGLU1PtwhZZepfVlV4UNqnIO06Nw7stMxJR5Uard0HdMZEgd2FwaDYGu
	se+vqMOW5AoI2qYBH37Odu2EPNkcZshqkWd/0sj11fJCPqJ58jJJYv45pfy76w==
Date: Fri, 23 Aug 2024 17:55:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Parshuram Thombare <pthombar@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boris Brezillon
 <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Culhane
 <conor.culhane@silvaco.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 02/11] i3c: master: Replace hard code 2 with macro
 I3C_ADDR_SLOT_BITS
Message-ID: <20240823175502.3d518a69@xps-13>
In-Reply-To: <20240819-i3c_fix-v3-2-7d69f7b0a05e@nxp.com>
References: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com>
	<20240819-i3c_fix-v3-2-7d69f7b0a05e@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_085506_379738_535A5310 
X-CRM114-Status: UNSURE (   7.44  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIE1vbiwgMTkgQXVnIDIwMjQgMTI6
MDE6NTYgLTA0MDA6Cgo+IFJlcGxhY2UgdGhlIGhhcmRjb2RlZCB2YWx1ZSAyLCB3aGljaCBpbmRp
Y2F0ZXMgMiBiaXRzIGZvciBJM0MgYWRkcmVzcwo+IHN0YXR1cywgd2l0aCB0aGUgcHJlZGVmaW5l
ZCBtYWNybyBJM0NfQUREUl9TTE9UX0JJVFMuCgpJJ20gZmluZSB3aXRoIHRoZSBpZGVhIGJ1dCBJ
IGRvbid0IHVuZGVyc3RhbmQgdGhlIG1hY3JvIG5hbWUuIFlvdSdyZQp0YWxraW5nIGFib3V0IHN0
YXR1cyBiaXRzIGFuZCB5ZXQgdGhlIG1hY3JvIGlzIG5hbWVkIGFkZHJfc2xvdD8KCj4gSW1wcm92
ZSBtYWludGFpbmFiaWxpdHkgYW5kIGV4dGVuc2liaWxpdHkgb2YgdGhlIGNvZGUuCgpUaGFua3Ms
Ck1pcXXDqGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtaTNjCg==
