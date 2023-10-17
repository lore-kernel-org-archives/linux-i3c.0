Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BCCCDB483
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 14:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JOAhPin5SDN1IrgT5n09SQn0ZlBal71P50Od/7ijk64=; b=RuJmWgVb+AWOEQ
	waHoz9vvNUmNXNFX4HkEcYvx31gYNqKfyHd+HLo/n33Z7053q/T2YKsJ9NPLV9YcpcVfwQA3FYc11
	5K9h5ltJPZj8RkOlyFjzdXyjYbWMv9oYUx8bD+z7a7RLAXEsZJC37UzYTrRF5u771N39tBujJdY/M
	rbSupTQ+JEiX7nhcszjUqfZI6+Hjr7PSA+RmLJ9SAlVgZRRVh5BLURxXUEq7qJ/fWWCfDKN3bBVsF
	3JSF5gVAJXWrtvYZ3q3wnYLOhXx86VrhXTLMuB23C1XuEp+TQ2QHz2soryxyghTE0x104ybF6Ezrg
	up0O8rDhLtXFaqa+MUfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qskh2-00CUbB-1M;
	Tue, 17 Oct 2023 14:05:08 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qskgz-00CUa4-1R
	for linux-i3c@lists.infradead.org;
	Tue, 17 Oct 2023 14:05:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0506240004;
	Tue, 17 Oct 2023 14:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697551501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n2SWgNzwjbBpSUOPGOrMP6yTVIG3XK+FVYK04/px9Nc=;
	b=l9ZgiPwgnCd8UaS+fNemzxUVyL/C+RETm7R5MvKzrQLG6sX0OaHgHAwWmSxAwGHifxKM8W
	+H1oQp0uLo8Fv4tjQfcQH48vA4GtaFD47CTSsfqjxlC6L1r8KxgUuphF5DitIfFKsRx6WR
	0nYkShZbHZ3KEFe2GD00si33MjdobYNPwihhAvh3oqbgNAJaodI7WLAE8oFozqlX83jdnf
	Nov2IVJUSPhjigdAPofmCdwvPEdHMfXdVLzKYuKQH82lV2Wkzra9nkWVwYDXwl9iKBv5Zm
	bYBRZZfbaFrq+0eHMnoW+X8Xyi1RA6l9py/6iZyTYf3FGrzHZ3y6B6md30wpsA==
Date: Tue, 17 Oct 2023 16:04:57 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/5] i3c: master: svc: enable hotjoin default
Message-ID: <20231017160457.4f0c2490@xps-13>
In-Reply-To: <20231016154632.2851957-2-Frank.Li@nxp.com>
References: <20231016154632.2851957-1-Frank.Li@nxp.com>
	<20231016154632.2851957-2-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_070505_636083_F6529D35 
X-CRM114-Status: UNSURE (   5.94  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIE1vbiwgMTYgT2N0IDIwMjMgMTE6
NDY6MjggLTA0MDA6Cgo+IEhvdGpvaW4gcmVxdWlyZSBjbG9jayBydW5uaW5nIGFuZCBlbmFibGUg
U0xWU1RBUlQgaXJxLgo+IEFkZCBtb2R1bGUgcGFyYW1ldGVyICdob3Rqb2luJyB0byBkaXNhYmxl
IGhvdGpvaW4gYW5kIGVuYWJsZSBydW50aW1lX3BtIHRvCj4gc2F2ZSBwb3dlci4KCkkgYW0gcmVh
bGx5IG5vdCBhIGJpZyBmYW4gb2YgdGhlIHVzZSBvZiBtb2R1bGVzIHBhcmFtZXRlcnMuIE1heWJl
IGl0Cm1ha2VzIHNlbnNlIGhlcmUuIEFsZXgsIGEgYmV0dGVyIGlkZWE/CgpUaGFua3MsCk1pcXXD
qGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNj
Cg==
