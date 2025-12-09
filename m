Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F27D1CDC6
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Dec 2025 12:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WOkI3uv57DReWNwQ314zSq64yY63XE+yvivHrquHRQI=; b=Yl9OXxmlywR/Wx
	EC+/olfhAK88WheUpr54g5tuGJeEphrpkx2sLOWQ/9N47/LyPQcoHUT+ACYqLnOpXosQCpjEkB568
	IyPJdtvPBixomrnPzjuGakBgaOcE9WU/wtliMGRtVwNe/6MUkAsCMXYaqbhhz0LxpAMiiaKkTduUm
	/smNf8UkPDFz1Rj2R19E8rL1QzkRBJyCCdHWDSqCQSXq1myx39tCvM3eoHtDxEUr+NCiKSBgaNUgs
	nj1j4L4YJvqwlH9Iv6f/Q9JOmVUhsBJ0mCrrBiCIhvlNQRvCpSylLSGAeifRag93xbN2XHH8KJibH
	mX545IVZHXYdr5KMJjRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSx9M-0000000EH8S-3yJJ;
	Tue, 09 Dec 2025 12:49:04 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSx9J-0000000EH7c-01wO
	for linux-i3c@lists.infradead.org;
	Tue, 09 Dec 2025 12:49:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 393A5C180D8
	for <linux-i3c@lists.infradead.org>; Tue,  9 Dec 2025 12:48:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EBE06606E2;
	Tue,  9 Dec 2025 12:48:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B1428119304DA;
	Tue,  9 Dec 2025 13:48:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765284535; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QnQMRmoOU+OL5dkdYEbV/v1tD233RbHPSjZ9Wla0k+8=;
	b=0/nerZEqgRVED1oJ3XYAhYVbgwERRcSrRWooCt2/RJITXQjGPzQn6wKafZxQJZ60TYh2aV
	ux/KBCSB/WtfwhCwT0hjvB85yMkywY3mTOrzs+ZBxBy4D3v7NK7yWuV91sW6jySW6Nogpe
	T/ajJlK+SQ01wN/l5r6rMqbf5e77i/ia4ZG+y+mDCOiNPyMqBeGoEfTuyAPSyhGCN6P+0B
	8l3axTNiKSgAVNBs6k9Lam4dNUAzj0OkICNT1Ws92qNKwgy+s03renwxwOB5EW6kDk0vFV
	G5S4tdpfBweivFhXiONw6iytsND3HH543FK7Q+o3CCuMBkLRXb7jnq504w3YNA==
Date: Tue, 9 Dec 2025 13:48:54 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Louis Sautier <louis.sautier@ovhcloud.com>
Cc: linux-i3c@lists.infradead.org
Subject: Re: Error while loading dw-i3c-master: UBSAN: shift-out-of-bounds in
 drivers/i3c/master/dw-i3c-master.c:885:12
Message-ID: <202512091248543fcf4c83@mail.local>
References: <66f5e4db-ac20-4bec-a437-af86aad1f56e@ovhcloud.com>
 <202512082058408ee92ee8@mail.local>
 <b9b568e8-8e21-49ac-b3dd-ab750fc329aa@ovhcloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b9b568e8-8e21-49ac-b3dd-ab750fc329aa@ovhcloud.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_044901_395412_6DABBB95 
X-CRM114-Status: GOOD (  20.67  )
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



On 09/12/2025 12:37:12+0100, Louis Sautier wrote:
> On 12/8/25 21:58, Alexandre Belloni wrote:
> > Hello Louis,
> > =

> > On 02/12/2025 21:17:31+0100, Louis Sautier wrote:
> > > Hello,
> > > =

> > > I'm running into a bug when loading the dw-i3c-master module on kerne=
l 6.18
> > > on one specific server. I suspect it has to do with the large number =
of
> > > CPUs=A0on the machine=A0(768 threads, from 2 AMD EPYC 9965 processors=
) but I am
> > > not sure.
> > > =

> > > The system is on Ubuntu 25.10 and a 6.18 kernel with https://gist.git=
hubusercontent.com/sbraz/a6f37fafbcf9354bbe4eace9e9eb48cb/raw/115da594dc9d7=
ea99b06754847571e6fd76d9da5/config
> > > (basically Ubuntu's).
> > Just to be sure, does this also happen with v6.17?
> > =

> > The only change is the shutdown handling so I would guess yes.
> > =

> Hello,
> =

> It does happen with 6.17. I initially discovered this while running Ubuntu
> 25.10's stock kernel (6.17.0).
> =

> > What is the behavior when you build the dw-i3c-master as a static drive=
r?
> I'll try CONFIG_DW_I3C_MASTER=3Dy and report back.
> =

> Someone also suggested (they didn't reply to the list though) that I add a
> printk to see what the value of maxdevs is. I'll provide the log as soon =
as
> I have rebuilt with:
> =

> --- linux-6.18.orig/drivers/i3c/master/dw-i3c-master.c	2025-11-30 22:42:1=
0.000000000 +0000
> +++ linux-6.18/drivers/i3c/master/dw-i3c-master.c	2025-12-08 18:17:33.151=
567225 +0000
> @@ -1588,6 +1588,7 @@
>  	ret =3D readl(master->regs + DEVICE_ADDR_TABLE_POINTER);
>  	master->datstartaddr =3D ret;
>  	master->maxdevs =3D ret >> 16;
> +	printk("maxdevs: %d\n",  master->maxdevs);
>  	master->free_pos =3D GENMASK(master->maxdevs - 1, 0);
>  	master->quirks =3D (unsigned long)device_get_match_data(&pdev->dev);
> =


Yes, that was going to be my suggestion.

-- =

Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
