Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AF9C46CD2
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Jan 2024 08:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=354kd+CfDyp57aK0WtnL1zRvf7huyqSFAiu5/IWsQfU=; b=oANYjwiQdDtudL
	WorKYvBm9IRXPXIRp1T9uKIDsIknG4ny+YI+1kpbBai2sibwMTEw9I3LZYfZV8A9mZW4Mxk5xVqnm
	hl+p/1Uw2a8ufUhEgL6sRFrkYcpzGRXrjwn8F8v1VhVxgo8Ju9yZvIMG5j6L0R1ZsH/MhWDy96j3E
	YxfSF7z+9cbx0zFAN/K/RCHhg8//WzvAtarVF4HkSxumoQVQG9zwwePqE7xAD2zRBgp0uLGwfYfPC
	E9iuQLIMM3ZADu5+UBk2iM8Ym8qS5YNMN1ksBONdZeboGBtpprHX9uSM6eGLl1WGM/kDUX1etAnAM
	6BSi843ilmEJ3BrLVXtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rN7By-007Fuv-28;
	Tue, 09 Jan 2024 08:10:34 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rN7Bw-007Fu1-0c
	for linux-i3c@lists.infradead.org;
	Tue, 09 Jan 2024 08:10:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41022240002;
	Tue,  9 Jan 2024 08:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704787827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NsnJZM8mE/E1TbZzElehXy7zAO8n/tIH97gjvK7JStQ=;
	b=PKD6vNYD/FbOVrUM3CYaa+zlkv7q4fQjwQ4CYAGkUu9dbRT/gSc9SMnDfXX6QArEjRa3dv
	YYWiXEh4wfbE9gkVcLCaIjIexTO0perzPNa/rCUBpP7HSJVEq2oWDDU5uc9pfj/gk5H96z
	m8C1vNj4qP1x8f71peSujRM26olrEq5PX3+nEBIlE8PnD3RdVFpm0gms2jkyt/YqHpYd16
	2FSRphA573USMrXhtNtpZdKzJ1JJg9/a3rEqnmcIc3C4QeUY8HhZctRi3rU8ZUyoKxo0K1
	Oi3wyrABs+N+EyQohINnOEYD6z5OWHGhk+ehyiuPxerrZ8RUw9EwldBraT1tpg==
Date: Tue, 9 Jan 2024 09:10:24 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, conor.culhane@silvaco.com, imx@lists.linux.dev,
 joe@perches.com, linux-i3c@lists.infradead.org,
 zbigniew.lukwinski@linux.intel.com
Subject: Re: [PATCH 1/1] i3c: master: fix kernel-doc check warning
Message-ID: <20240109091024.40fd1dfb@xps-13>
In-Reply-To: <20240109052548.2128133-1-Frank.Li@nxp.com>
References: <20240109052548.2128133-1-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_001032_526560_5666EA36 
X-CRM114-Status: UNSURE (   5.68  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIFR1ZSwgIDkgSmFuIDIwMjQgMDA6
MjU6NDggLTA1MDA6Cgo+IEZpeCB3YXJuaW5nIGZvdW5kIGJ5Cj4gCSdzY3JpcHRzL2tlcm5lbC1k
b2MgLXYgLW5vbmUgaW5jbHVkZS9saW51eC9pM2MvbWFzdGVyLmgnCj4gCj4gaW5jbHVkZS9saW51
eC9pM2MvbWFzdGVyLmg6NDU3OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVy
ICdlbmFibGVfaG90am9pbicgbm90IGRlc2NyaWJlZCBpbiAnaTNjX21hc3Rlcl9jb250cm9sbGVy
X29wcycKPiBpbmNsdWRlL2xpbnV4L2kzYy9tYXN0ZXIuaDo0NTc6IHdhcm5pbmc6IEZ1bmN0aW9u
IHBhcmFtZXRlciBvciBtZW1iZXIgJ2Rpc2FibGVfaG90am9pbicgbm90IGRlc2NyaWJlZCBpbiAn
aTNjX21hc3Rlcl9jb250cm9sbGVyX29wcycKPiBpbmNsdWRlL2xpbnV4L2kzYy9tYXN0ZXIuaDo0
OTk6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2hvdGpvaW4nIG5vdCBk
ZXNjcmliZWQgaW4gJ2kzY19tYXN0ZXJfY29udHJvbGxlcicKPiAKPiBTaWduZWQtb2ZmLWJ5OiBG
cmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4KClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNj
IG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
