Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362B5C001E0
	for <linux-i3c@archiver.kernel.org>; Sat, 21 Oct 2023 17:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zd7fh5Tc34d/8FwXs2zOBP9ReDzffUQnKmwCqJFZF88=; b=RR7K8wuPeuR1GI
	lF0QoELezP8+pmg2Rwl6vXjAd0Y+yjcdA0nWUmNmUfHBymLXKtX+kheFMRtyVJ1n7eJjrm7A8ic9c
	V3s2HSFdsB5XJffEgGF/PUBBZofr6Gt0y47AWxwzSmhWwXvrY/O+YHTyCKvMcHSVLw7uLszhp/u+u
	ryeenlwOWnQyj/Is7kFjJNmWpt53RYMTqAJoIUc2I+tFkCGDP9Rptu1a5mmRMSEolIssBp8d//IbK
	9G3vs27kDiR8ixpu+yqKuWe8SArtxz81MuuMT3TJh8kERmfma3+BH9A3ZXBCfkkOoE60Ivb5T8xIU
	HQxgbXO0gG9KMoEBlmEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quFND-004H8c-1V;
	Sat, 21 Oct 2023 17:02:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quFN7-004H78-0W
	for linux-i3c@lists.infradead.org;
	Sat, 21 Oct 2023 17:02:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8B068B80E95;
	Sat, 21 Oct 2023 17:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA79C433C8;
	Sat, 21 Oct 2023 17:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697907762;
	bh=ZR0ckwmKzr4OchS2lwegZntLrbRhjuWKJprTwNRlhKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zzx55b4erPsj7YZNMNfFtL2EtmGTBx0Bp8qXeeztQVL8bzemR3zSoIF3OqMZBWbVy
	 TKGFpCdKi1sb9UX1yXAEWGoFIdo7ftlaHaZahg/CvnyYEf6+MgJ73glavxb/S2a5Ug
	 ZDAIJqhM9BGAtQ2ipnOOIME9F6CNOGlX9qsRlrfE=
Date: Sat, 21 Oct 2023 19:02:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
	imx@lists.linux.dev, jirislaby@kernel.org, joe@perches.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, miquel.raynal@bootlin.com
Subject: Re: [PATCH v2 1/1] tty: i3c: add TTY over I3C master support
Message-ID: <2023102105-outfit-legroom-1633@gregkh>
References: <20231020160027.3663772-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231020160027.3663772-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231021_100245_338029_9000B800 
X-CRM114-Status: GOOD (  14.72  )
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

Note, your subject line needs to change.

On Fri, Oct 20, 2023 at 12:00:27PM -0400, Frank Li wrote:
> In typical embedded Linux systems, UART consoles require at least two pins,
> TX and RX. In scenarios where I2C/I3C devices like sensors or PMICs are
> present, we can save these two pins by using this driver. Pins is crucial

"Pins are crucial"

> resources, especially in small chip packages.
> 
> This introduces support for using the I3C bus to transfer console tty data,
> effectively replacing the need for dedicated UART pins. This not only
> conserves valuable pin resources but also facilitates testing of I3C's
> advanced features, including early termination, in-band interrupt (IBI)
> support, and the creation of more complex data patterns. Additionally,
> it aids in identifying and addressing issues within the I3C controller
> driver.

But where is the serial data ending up at?  Not a normal uart, what is
on the other end?  And do line settings mean anything here?

> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> 
> Notes:
>     This patch depend on
>     https://lore.kernel.org/imx/20231018205929.3435110-1-Frank.Li@nxp.com/T/#t

Let's wait for those to be accepted first, right?

> +static DEFINE_IDR(i3c_tty_minors);
> +static DEFINE_MUTEX(i3c_tty_minors_lock);

I thought idr didn't need a mutex anymore, are you sure this is still
needed?

> +static struct tty_driver *i3c_tty_driver;
> +
> +#define I3C_TTY_MINORS		256

Do you really need 256 minors?

> +#define I3C_TTY_TRANS_SIZE	16
> +#define I3C_TTY_RX_STOP		0
> +#define I3C_TTY_RETRY		20
> +#define I3C_TTY_YIELD_US	100
> +
> +struct ttyi3c_port {
> +	struct tty_port port;
> +	int minor;
> +	spinlock_t xlock; /* protect xmit */
> +	char tx_buff[I3C_TTY_TRANS_SIZE];
> +	char rx_buff[I3C_TTY_TRANS_SIZE];
> +	struct i3c_device *i3cdev;
> +	struct work_struct txwork;
> +	struct work_struct rxwork;
> +	struct completion txcomplete;
> +	unsigned long status;
> +	int buf_overrun;

You set buf_overrun but never do anything with it.  Why care about it?

Other than these minor things, looks sane, nice work.

thanks,

greg k-h

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
