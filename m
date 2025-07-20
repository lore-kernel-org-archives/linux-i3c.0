Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E609C83F34
	for <linux-i3c@archiver.kernel.org>; Sun, 20 Jul 2025 00:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fDPIB3CKhqi3ENfiCtVmuFc5oSgCsLCamBxNXt9kJrg=; b=YIrmOL+N+7TSYJ
	HNYB6GZ1yFO20iic5Yo8voiCJhtgJLrk1znSKRmxpZNbUdqiDInmZCkEdxWFJweCmnJ8jj6QuMOUy
	1GNY1sAmQSzIoBJ9vQBRCe6jWDlOHowtrehYHeO2bovN9V4VCC3XSSmFutgu8omMKr+hZ/vM7VOFp
	bAikRERuYC1cBoCIydUpbKn+LjUEsl1oy2LUs7ClRlvY4s1nAIo+JECaXlksz7M4gcQ3irb6+f4+t
	Xilq9MB2s8u2knBZ6jmHHQj364NJm/x0OzeJVW1XmlSqTlCUQqafj/5FxaGX1Vx/oSBkJCktpNNtt
	E2fmkXIwy/XrCynuCwdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udHuY-0000000Elmo-0CGE;
	Sun, 20 Jul 2025 00:28:14 +0000
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udHuV-0000000ElmW-3YAZ;
	Sun, 20 Jul 2025 00:28:11 +0000
Message-ID: <b429bfdd-a66d-46db-b13d-73e81d36ac8d@infradead.org>
Date: Sat, 19 Jul 2025 17:28:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i3c: Fix i3c_device_do_priv_xfers() kernel-doc
 indentation
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux i3c <linux-i3c@lists.infradead.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>
References: <20250702040424.18577-1-bagasdotme@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250702040424.18577-1-bagasdotme@gmail.com>
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



On 7/1/25 9:04 PM, Bagas Sanjaya wrote:
> Sphinx reports indentation warning on i3c_device_do_priv_xfers() return
> value list:
> 
> Documentation/driver-api/i3c/device-driver-api:9: ./drivers/i3c/device.c:31: ERROR: Unexpected indentation. [docutils]
> 
> Format the list as bullet list to fix the warning.
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> Changes since v1 [1]:
> 
>   * Follow kernel-doc style on return list
>   * Patch subject massage (Frank)
>   * Drop Fixes: tag (Frank)
> 
> [1]: https://lore.kernel.org/r/20250626042201.44594-1-bagasdotme@gmail.com/
> 
>  drivers/i3c/device.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> index e80e4875691467..2396545763ff85 100644
> --- a/drivers/i3c/device.c
> +++ b/drivers/i3c/device.c
> @@ -26,11 +26,12 @@
>   *
>   * This function can sleep and thus cannot be called in atomic context.
>   *
> - * Return: 0 in case of success, a negative error core otherwise.
> - *	   -EAGAIN: controller lost address arbitration. Target
> - *		    (IBI, HJ or controller role request) win the bus. Client
> - *		    driver needs to resend the 'xfers' some time later.
> - *		    See I3C spec ver 1.1.1 09-Jun-2021. Section: 5.1.2.2.3.
> + * Return:
> + * * 0 in case of success, a negative error core otherwise.
> + * * -EAGAIN: controller lost address arbitration. Target (IBI, HJ or
> + *   controller role request) win the bus. Client driver needs to resend the
> + *   'xfers' some time later. See I3C spec ver 1.1.1 09-Jun-2021. Section:
> + *   5.1.2.2.3.

I would use %0 and %-EAGAIN here but that's just for pretty printing. :)

>   */
>  int i3c_device_do_priv_xfers(struct i3c_device *dev,
>  			     struct i3c_priv_xfer *xfers,

-- 
~Randy

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
