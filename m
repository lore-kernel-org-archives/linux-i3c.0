Return-Path: <SRS0=HGQP=4J=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8FCDC35669
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2020 22:32:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF4DB206EF
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2020 22:32:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mj1+oCou"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF4DB206EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fwbNJZln4Obh6mDLXHPla6Bc1hDePsSpb6NDZnnXlds=; b=Mj1+oCouLI9d8r
	J5/qTX7R+5IFtHvZjiqMDze4jg31JQ+RME2t3yhOEofiLhTo6wkKR+NQnBJQQI/7lNd32RRI4V2Ed
	sIhvqz4zBH9XvKynH90lf9wDfkfz+eB/wY+2Ap0zMwTesDvYEDhBSb0xrcpst4o1ut45ka1r2pNFR
	bCIjSHPAcRe2TAEsIv344623lUelBKUZrE7WmgomXbvVf5CKf1z56/eQAnu/kfIhcux5m/pX5/FOW
	4q3fmNamk6+X1qA4iQRvGCQv5kp3/xNnWQ/tz2CA1aZjPi/EKq71TElR4KmUoYHLcUd1jfRwUUCVo
	xRN2wpHgUh5gSCVpNLTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5GqO-0002OU-NG; Fri, 21 Feb 2020 22:32:24 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5GqM-0002Nf-0y
 for linux-i3c@lists.infradead.org; Fri, 21 Feb 2020 22:32:23 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D6056295BD2;
 Fri, 21 Feb 2020 22:32:19 +0000 (GMT)
Date: Fri, 21 Feb 2020 23:32:16 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v3 4/5] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <20200221233216.3b2038f8@collabora.com>
In-Reply-To: <e093ae9da81e7702c188a20d1e8b9d7f8024bfeb.1582069402.git.vitor.soares@synopsys.com>
References: <cover.1582069402.git.vitor.soares@synopsys.com>
 <e093ae9da81e7702c188a20d1e8b9d7f8024bfeb.1582069402.git.vitor.soares@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_143222_196259_DC266AFE 
X-CRM114-Status: GOOD (  10.12  )
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
Cc: Jose.Abreu@synopsys.com, Joao.Pinto@synopsys.com, arnd@arndb.de,
 corbet@lwn.net, gregkh@linuxfoundation.org, wsa@the-dreams.de,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-i3c@lists.infradead.org, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, 19 Feb 2020 01:20:42 +0100
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> +static int i3cdev_detach(struct device *dev, void *dummy)
> +{
> +	struct i3cdev_data *i3cdev;
> +	struct i3c_device *i3c;
> +
> +	if (dev->type == &i3c_masterdev_type)
> +		return 0;
> +
> +	i3c = dev_to_i3cdev(dev);
> +
> +	i3cdev = i3cdev_get_drvdata(i3c);
> +	if (!i3cdev)
> +		return 0;
> +
> +	/* Prevent transfers while cdev removal */
> +	mutex_lock(&i3cdev->xfer_lock);
> +	cdev_del(&i3cdev->cdev);

When cdev_del() returns there might be opened FDs pointing to your
i3cdev [1] ...

> +	device_destroy(i3cdev_class, MKDEV(MAJOR(i3cdev_number), i3cdev->id));
> +	mutex_unlock(&i3cdev->xfer_lock);
> +
> +	ida_simple_remove(&i3cdev_ida, i3cdev->id);
> +	put_i3cdev(i3cdev);

... and you call put_i3cdev() here which frees the i3cdev object,
leading to potential use-after-free if any of the fops (ioctl, read,
write) are called on those dangling FDs. That's exactly the kind of
nightmare I'd like to avoid.

> +
> +	pr_debug("i3cdev: device [%s] unregistered\n", dev_name(&i3c->dev));
> +
> +	return 0;
> +}
> +

[1]https://elixir.bootlin.com/linux/latest/source/fs/char_dev.c#L587

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
