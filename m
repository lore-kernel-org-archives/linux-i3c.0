Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0E2C79F99
	for <linux-i3c@archiver.kernel.org>; Mon,  7 Sep 2026 14:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H0OikU/1n6cIlMI6le8EDVyj20bHcER+O/Qn4hbFDWY=; b=HyKFUXdLal20Bk
	7FLHE4dOt9Zx04f0J6QjukQzO8ZD3ztcVnXaMPHLuXxifJRYlIBFaco9QRNg45CdhxkSqpqqq0pyC
	HZw2ZoieYmaC9hD72R8IVCK3SKMdyDTpo61FH+KKvVp2qUpWPpNQFFnPHIODyNQvYh4Gt94hzOPRx
	Lw6SIvHiWJyItyEos8LLj7KsvOcWF1xYlyOodqFAJYwji73gl1H5nno1bI95FxFfw9HZ1sr7sr06a
	rc6Hs4HN+nWeoMS2Cb3Oa15ykD7F6bLjKANBejFKa9LoX8TfF/6YwmskkOAU/CmKtxoa1UHDbynYE
	i9gE7P71xjvCJvtyx+YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3aYa-000000074Kb-2Lt0;
	Mon, 07 Sep 2026 14:42:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3aYY-000000074KV-3ZmV
	for linux-i3c@lists.infradead.org;
	Mon, 07 Sep 2026 14:42:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C7E2441B32;
	Mon,  7 Sep 2026 14:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C23D1F00A3A;
	Mon,  7 Sep 2026 14:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788792163;
	bh=hdT6u1gNNq87E/Xh1itonhXL5BkgCb8J/RAJ9RiAg6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mnpOrYKWnzpUSewfqMNQbrrPQoJkKmSUNfHPj6wFWA1agrpWKktg4cocfkl3GQhLG
	 WcfhhZg//ID6ozRlh9+PZ9zsLR5C6MKiD8gmG3oBiTmHldCQG1oEh83N0LWBM85aoi
	 1tdB8LRQFEm6pRbuGg7PPWAwnLIh88wmIAhTWpLA=
Date: Mon, 7 Sep 2026 16:40:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sam Agazaryan <samagazaryan@google.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
	Vitor Soares <vitor.soares@toradex.com>,
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <2026090737-unicycle-imprudent-dcd2@gregkh>
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-4-samagazaryan@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260906202747.4041389-4-samagazaryan@google.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Sun, Sep 06, 2026 at 08:27:47PM +0000, Sam Agazaryan wrote:
> +/**
> + * struct i3c_ioc_priv_xfer - I3C SDR ioctl private transfer
> + * @data: Holds pointer to userspace buffer with transmit data.
> + * @len: Length of data buffer buffers, in bytes.
> + * @rnw: encodes the transfer direction. true for a read, false for a write

You do not describe the "pad" variable.

And why not call "rnw" "direction"?

> + */
> +struct i3c_ioc_priv_xfer {
> +	__u64 data;
> +	__u16 len;
> +	__u8 rnw;
> +	__u8 pad[5];

You do not enforce that pad[5] MUST be set to all 0.

thanks,

greg k-h

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
