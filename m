Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6331DD3B7EA
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Dec 2025 20:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzbzCuPdi7bYec+6Ex/BOPynvEFeNjuO2uRV7erU3cY=; b=cCKD44KiybJ0Of
	4LCOQ2fyI2z+93aRYAGD/Nvq0DN9Se7wRyers27N4WVDsHB9o1u3i4yiFi5cuSjlPHNW1f/b32zXq
	saDayJZoQIvBnTASZAoiHSmlZNhAsOLOF/zbSoB13nbaMPb2fL4PnFVoFqhg+3BqTwV2jVR72vrEd
	vK7qxzDUs6H7j2BCpaYPjviZsRfA3Vv1JcK+Mt3kGNMnvMCoboWiOx0LQIPP37cG7NGgoiZSoMB4u
	JZrxjVr2ymstFhWMptlLLB9hGA98fMJd+NCmR8ikazDV/j1jtaavvWrRyOpIo3tJGxsmtBu0ad65y
	fVqDRJkwtuJQy75RKa4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSiJn-0000000DXIh-1uUD;
	Mon, 08 Dec 2025 20:58:51 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSiJi-0000000DXI3-3K5V
	for linux-i3c@lists.infradead.org;
	Mon, 08 Dec 2025 20:58:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BA593C180D2
	for <linux-i3c@lists.infradead.org>; Mon,  8 Dec 2025 20:58:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F420606DD;
	Mon,  8 Dec 2025 20:58:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 65C04103C8E53;
	Mon,  8 Dec 2025 21:58:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765227523; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5kOlrp0GAPC3YlAOAn7z0/z8R1NasToaDwdGWoi8Mx8=;
	b=TJeI5O3WxcTByeZyDFTttSmGQiBMvB75yb1QUT6NLxUzM14yGDFpKCjXalsfjFUIr4+0Sw
	u4e3Ps3+BZfFL9NCMBKPWa5aatgddecN9Nqw8YPRZgFaCpGNaU19fEtnTc2BQ6EistXT4Z
	2GQC5/DXTwEz1PnTv8+sNIsDrv7tCyWGClJi3hUWxovmv2LqlEKCf2f1oVuAus1lfXAU9M
	kPtyNO5NkjvgOh7iIjb++bUnDpRAglVjIu6dYfM87VI3F3mibRzDXDqOY5COIIn9/Ro6J/
	l0KOdOblRhOK6TQ4hUjUU4Ox6RPu2kKv4uiKeNJfbgeBoBOpHWjMGnceHaO9MQ==
Date: Mon, 8 Dec 2025 21:58:40 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Louis Sautier <louis.sautier@ovhcloud.com>
Cc: linux-i3c@lists.infradead.org
Subject: Re: Error while loading dw-i3c-master: UBSAN: shift-out-of-bounds in
 drivers/i3c/master/dw-i3c-master.c:885:12
Message-ID: <202512082058408ee92ee8@mail.local>
References: <66f5e4db-ac20-4bec-a437-af86aad1f56e@ovhcloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <66f5e4db-ac20-4bec-a437-af86aad1f56e@ovhcloud.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_125847_349651_18B1F37B 
X-CRM114-Status: GOOD (  11.04  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello Louis,

On 02/12/2025 21:17:31+0100, Louis Sautier wrote:
> Hello,
> =

> I'm running into a bug when loading the dw-i3c-master module on kernel 6.=
18
> on one specific server. I suspect it has to do with the large number of
> CPUs=A0on the machine=A0(768 threads, from 2 AMD EPYC 9965 processors) bu=
t I am
> not sure.
> =

> The system is on Ubuntu 25.10 and a 6.18 kernel with https://gist.githubu=
sercontent.com/sbraz/a6f37fafbcf9354bbe4eace9e9eb48cb/raw/115da594dc9d7ea99=
b06754847571e6fd76d9da5/config
> (basically Ubuntu's).

Just to be sure, does this also happen with v6.17?

The only change is the shutdown handling so I would guess yes.

-- =

Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
