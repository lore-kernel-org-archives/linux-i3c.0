Return-Path: <SRS0=zIxT=2G=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7ABC43603
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Dec 2019 18:36:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E6E521582
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Dec 2019 18:36:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p8CSY9nI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9ZKtIix"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E6E521582
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ERxyKdI8O+FkCBhBawBJpb9ddZmCnLNaU0tH8qctKgY=; b=p8CSY9nI6ehdmD
	gm1vALgGL2+R7VWd+L/3UEQk1VvQ2tKPQNd+LUtC/5kUNqCqVAbW7kMFI0/7ygOncRtWeil6Ii5Mf
	qfZp+H/4raxH0hzS9T/EmibOJnPMgb/jJ1MVbAZRZtzo6klPaU6Farkem/TNZAQGO0O+EQgL9vq/u
	wz35bdkGt5nG5g8ubqFyaJyw9BKNqJ2XuT/8y6Kxha8TkmhGZxvUtCLoMCd1PuxzLPtiYJf9q3+tR
	64swuRchGSqvyw2WAak3JWS0dNl2QVk/uJPw2QbBlbee0fY7KYSqvgDiAra5OH+ssAizP0FI9AQLh
	+TJxQ6fcrjvO7y2fhimQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igvE1-0004hY-E8; Mon, 16 Dec 2019 18:36:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifPja-0001I5-4Q
 for linux-i3c@lists.infradead.org; Thu, 12 Dec 2019 14:46:31 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 595D222527;
 Thu, 12 Dec 2019 14:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576161989;
 bh=LQ+QqJke3k2uOefv9MNRRbl/t4c8KgxsP2Atg7f46Sk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q9ZKtIix0AD1Yhhr/dobmWey6VrOfRRFSLp1tg88whojYHHs/V2riyUdxMolNs+ll
 Y5DdjM60CyH5pmEfLudLH3sPFfCghNUCcaP1I0fIBps6GudlXY30fjd36i6JNKkEMS
 aZ6zJ8oFrGyKefLK6NNuQ+OtUgv/+M/qbJsY3q+E=
Date: Thu, 12 Dec 2019 15:46:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [RFC 5/5] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <20191212144627.GC1668196@kroah.com>
References: <cover.1575977795.git.vitor.soares@synopsys.com>
 <f9f20eaf900ed5629dd3d824bc1e90c7e6b4a371.1575977795.git.vitor.soares@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f9f20eaf900ed5629dd3d824bc1e90c7e6b4a371.1575977795.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_064630_192439_80D7C818 
X-CRM114-Status: UNSURE (   6.67  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 16 Dec 2019 10:36:06 -0800
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Joao.Pinto@synopsys.com, arnd@arndb.de, wsa@the-dreams.de,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, Dec 10, 2019 at 04:37:33PM +0100, Vitor Soares wrote:
> +static struct i3cdev_data *i3cdev_get_by_minor(unsigned int minor)

Why?  Why not just embed the structure in the cdev if you really need
it?

> +static struct i3cdev_data *get_free_i3cdev(struct i3c_device *i3c)
> +{
> +	struct i3cdev_data *i3cdev;
> +	unsigned long minor;
> +
> +	minor = find_first_zero_bit(minors, N_I3C_MINORS);

No locking, fun!!!

:(

Why not use an idr instead, that is what it is there for.  Don't try to
roll your own.

thanks,

greg k-h

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
