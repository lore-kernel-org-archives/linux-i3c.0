Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0ECD3C92B
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Dec 2025 16:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5SYm2Ri1DBwDc8poWCImPCldq4jQTsbzcIqbCMFneaQ=; b=QxaZwVPAjDeiZj
	t3Y/ZL3LR68ieDzAhTEhtQdvTuK06w/Hl4y5DGe9/+j/xY2Jf+RpQ2Q+4ODrB9rQctJQtUUUuO1E5
	gZzE/zc8+GOBjaaNPsOZGVCNvnpJVGL3Tiz7/5iDnUARl9Li4VGwWG+YpETCbnAk27mO9Mr3VHTuc
	VqIDLGWfXCPx5uJSSQxOdOj24ToRT9KNwcy5o+k4AHtirh3Llm/D6XdCYhgawjc9z7axm7wADja1J
	4qcm9GWpBPCDVvU9MohuOmvOJv7E6knJSDUzYJedkCqNXQHF/poWDRe3TPHhJS3kUYRhUgesjH4kF
	PkkoGxq+ZSNLxBpvJVBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMwO-0000000FdcO-22mI;
	Wed, 10 Dec 2025 16:21:24 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMwL-0000000Fdbd-2Vkl
	for linux-i3c@lists.infradead.org;
	Wed, 10 Dec 2025 16:21:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5473E4E41B46
	for <linux-i3c@lists.infradead.org>; Wed, 10 Dec 2025 16:21:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11EAE60714;
	Wed, 10 Dec 2025 16:21:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D98C81193198E;
	Wed, 10 Dec 2025 17:21:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765383677; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=OdGr09HP83+NAUHKuwMuLXwfvLUxdEDkI8tUEqLsaMQ=;
	b=Wu7XekLR9/fynI5po2VSzwUNSs3vOjgf7NEqXn6mvqaUSKgOWYpctF0LI13TL0W3PQ+ZiD
	QNenhX+xuKDnjZKLSXOkEfuuiXuOAMoE31U5vDql0dq6NK05VDNIVcSBZosn+bPaL2s4+D
	2tVzWr0JNsgfl1B02nrM/RBW6L4NGN/6AONeEidvc6FXe9BXJUiiZDsZ7B4Cw9iB0HZ+/m
	fhxnX5QOyqsWSNQUZykhTlAQ9Hr+e3lZhaieQwbmXTym7QmUSMAdqQ0XodrMEy83BROu+p
	djLOOqnBWPlOLUsDmGIHGitZu2SKSNOPEGu8iSV7oyUfde2s7Jots8uuqqlTTg==
Date: Wed, 10 Dec 2025 17:21:16 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: adrianhoyin.ng@altera.com
Cc: Frank.Li@nxp.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/5] i3c: add sysfs entry for Device NACK Retry count
Message-ID: <202512101621169fc49b8c@mail.local>
References: <cover.1765177110.git.adrianhoyin.ng@altera.com>
 <35bb0a3cae4664dc423ef57a1ef3ebcb378bce00.1765177110.git.adrianhoyin.ng@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <35bb0a3cae4664dc423ef57a1ef3ebcb378bce00.1765177110.git.adrianhoyin.ng@altera.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_082121_768903_356376A3 
X-CRM114-Status: GOOD (  14.56  )
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

On 08/12/2025 15:11:16+0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> 
> Document sysfs attribute dev_nack_retry_cnt that controls the number of
> automatic retries performed by the I3C controller when a target device
> returns a NACK
> 
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/ABI/testing/sysfs-bus-i3c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Please squash 1/5 and 2/5.

> diff --git a/Documentation/ABI/testing/sysfs-bus-i3c b/Documentation/ABI/testing/sysfs-bus-i3c
> index c812ab180ff4..0b8a0c223f4a 100644
> --- a/Documentation/ABI/testing/sysfs-bus-i3c
> +++ b/Documentation/ABI/testing/sysfs-bus-i3c
> @@ -161,3 +161,15 @@ Contact:	linux-i3c@vger.kernel.org
>  Description:
>  		These directories are just symbolic links to
>  		/sys/bus/i3c/devices/i3c-<bus-id>/<bus-id>-<device-pid>.
> +
> +What:		/sys/bus/i3c/devices/i3c-<bus-id>/<bus-id>-<device-pid>/dev_nack_retry_count
> +KernelVersion:  6.18
> +Contact:	linux-i3c@vger.kernel.org
> +Description:
> +		Expose the dev_nak_retry_count which controls the number of
> +		automatic retries that will be performed by the controller when
> +		the target device returns a NACK response. A value of 0 disables
> +		the automatic retries. A max value of 3 can be configured. Exist
> +		only when I3C constroller supports this retry on nack feature.
> +
> +		Valid values: 0-3
> -- 
> 2.49.GIT
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
