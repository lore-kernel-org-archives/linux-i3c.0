Return-Path: <SRS0=zIxT=2G=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FD8C2D0D3
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Dec 2019 18:36:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A78F20733
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Dec 2019 18:36:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U33U9DPL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="r57OQ5Q6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A78F20733
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4VJoGA+jOUTqtmLX5jUDWb/IDetVKyxfWCamU9HRZ4M=; b=U33U9DPLqt7nfo
	kIP+5rZqZsF+QGXfbSu5YetDSRLt4ZMtKo6hHV5N4d/T5jeeyZ0buXStN1IACqz+hK9h1hEqH3bsR
	nVINYuYvXDpmt8RCheJBhWD0WuMoglJ24Jn17pLBmbSACwwn3gLldnWnUEufRci6VZgkHI/Jzv0q+
	kPbBKSW6zugjUTj2swRefRJAHu2kBnpZUpdH+KnAJ9O1FfVhL7sbN/x4+bRRBbWtJ9qdWg5h0U109
	BBwRevAwQJZsnR5uFF2qJ8KTlkQ/oq6wf96ptuUvd2d9m3m0Ga+nxDP19QQ+cNNaMc4drN+kY4LeK
	pxaXZWg37f2m3EtyN2Zg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igvE1-0004hl-J1; Mon, 16 Dec 2019 18:36:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifQtU-000200-Hp
 for linux-i3c@lists.infradead.org; Thu, 12 Dec 2019 16:00:49 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 42DC92073D;
 Thu, 12 Dec 2019 16:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576166447;
 bh=zOhoZ96LZPHtESEGfmQk605Uix32gjBq5vRqbFWGo50=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r57OQ5Q6oili066DWlG8wNJ7fCnYqAjMHu8NCCPkw5/HF22VkrDgo5MdRtXUeS6G+
 jFzQ9AV0kI7c+ArFu7TsHFJIR4R/SEf5Eh9lpAGndlSSlEr8MR9rHNfNPu2T5SvfBq
 1xCrraeRlQKZkHh1836t26NluQWN5Wy7Xcidf7i8=
Date: Thu, 12 Dec 2019 17:00:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [RFC 5/5] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <20191212160045.GA1672362@kroah.com>
References: <cover.1575977795.git.vitor.soares@synopsys.com>
 <f9f20eaf900ed5629dd3d824bc1e90c7e6b4a371.1575977795.git.vitor.soares@synopsys.com>
 <20191212144459.GB1668196@kroah.com>
 <CH2PR12MB421658E00DF331400728DB6CAE550@CH2PR12MB4216.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH2PR12MB421658E00DF331400728DB6CAE550@CH2PR12MB4216.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_080048_606259_CBAED6A6 
X-CRM114-Status: GOOD (  11.38  )
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
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "wsa@the-dreams.de" <wsa@the-dreams.de>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, Dec 12, 2019 at 02:56:56PM +0000, Vitor Soares wrote:
> Hi Greg,
> 
> From: Greg KH <gregkh@linuxfoundation.org>
> Date: Thu, Dec 12, 2019 at 14:44:59
> 
> > On Tue, Dec 10, 2019 at 04:37:33PM +0100, Vitor Soares wrote:
> > > +static int __init i3cdev_init(void)
> > > +{
> > > +	int res;
> > > +
> > > +	pr_info("i3c /dev entries driver\n");
> > 
> > Please remove debugging information, kernel code should be quiet unless
> > something goes wrong.
> 
> I will remove it.
> 
> > 
> > > +	/* Dynamically request unused major number */
> > > +	res = alloc_chrdev_region(&i3cdev_number, 0, N_I3C_MINORS, "i3c");
> > 
> > Do you really need a whole major, or will a few minors work?
> > 
> > thanks,
> > 
> > greg k-h
> 
> I'm reserving one per device. What do you suggest?

How many devices do you have in a system?

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
