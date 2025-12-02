Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08615D12688
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Dec 2025 23:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fsY0T0os064Xx1N3TfG3bnWG2SgRvRoNq0/nYFlquRY=; b=fSraGHEx97i3FH
	tVZTL/t8egz+mX2ExSX8j+XApdRdwCDH7gc6oJ9I1yVTpw1IkdQAQaheN8iyhupub3CMw5mv6FSmf
	fPaSHOUSChjrLWtT28uWo+DGgvEa8Z2ZHto3Q47y2IDbGrfVelIGzG9WijcBc/++Dfe/CG/xCHEO2
	6db6cmW9hOcro6pfMu/6Hhi+zHu9xFK53vj+zecqAT/nICy0BPWB4T3Wj4hjLmb3P/37An8lyVLIM
	9zPxeGdtHVXK+HvYQS0fOLMDHfMsjYDrWILVQ8kvENXzGqPu9iLB+TW29H14wI/opfabEgawMzMVG
	E1BGcqvZbWYcWZuIgE5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQZax-00000005vhW-1PzM;
	Tue, 02 Dec 2025 23:15:43 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQZat-00000005vh1-1phL
	for linux-i3c@lists.infradead.org;
	Tue, 02 Dec 2025 23:15:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A7AF0C15D7E;
	Tue,  2 Dec 2025 23:15:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C7F71606D6;
	Tue,  2 Dec 2025 23:15:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0C669103C8BE6;
	Wed,  3 Dec 2025 00:15:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764717334; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=QVCEtMPxUMzXVw1tyOYFZnZkE2dG16ZIPwRsI86PDIw=;
	b=g2ETMRDd1PtRSkP2sPHrCCQihw5ErXT3zmAqujO2QXqemb5zcQzwwqP0OB1XOI6Ev1Pi9b
	t+Du3clnlXw0scsQsz7HylEf7VfZAk7Do79jbMfpt14tYXKRVspzWZYiOX+e/ayF9ff8NZ
	8ctyciOlNEJCjygCVEoFhzAcMkR60Lnr9+WaqTSp3LUXBZxk3P5gkq1ndW0W7UIKACZbSB
	THM/j0KyWTTsemu5E8P4AUCLZNhr+8eTUrS+o3bLjmXMVwa0Eo1deR3wIeRhUT1qCOrgiR
	767CUqLtnWn6lm2mq/ZRDtEntUIhsjQ3vk08dDq4lcV0t2PgK5rieR9whGBO0Q==
Date: Wed, 3 Dec 2025 00:15:26 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Matt Johnston <matt@codeconstruct.com.au>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH 4/4] i3c: drop i3c_priv_xfer and
 i3c_device_do_priv_xfers()
Message-ID: <2025120223152613f1586a@mail.local>
References: <20251028-lm75-v1-0-9bf88989c49c@nxp.com>
 <20251028-lm75-v1-4-9bf88989c49c@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251028-lm75-v1-4-9bf88989c49c@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_151540_499794_291704CD 
X-CRM114-Status: GOOD (  19.74  )
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

Hello Frank,

You'll have to rebase this patch.

On 28/10/2025 10:57:55-0400, Frank Li wrote:
> Drop i3c_priv_xfer and i3c_device_do_priv_xfers() after all driver switch
> to use new API.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> This patch need be applied after all other patches applied.
> ---
>  include/linux/i3c/device.h | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> index ae0662d9d77eb3fa0c976de1803e9c2ff9547451..47e6c95d87f9494d48c5b0463544916f26923501 100644
> --- a/include/linux/i3c/device.h
> +++ b/include/linux/i3c/device.h
> @@ -25,7 +25,7 @@
>   * @I3C_ERROR_M2: M2 error
>   *
>   * These are the standard error codes as defined by the I3C specification.
> - * When -EIO is returned by the i3c_device_do_priv_xfers() or
> + * When -EIO is returned by the i3c_device_do_i3c_xfers() or
>   * i3c_device_send_hdr_cmds() one can check the error code in
>   * &struct_i3c_xfer.err or &struct i3c_hdr_cmd.err to get a better idea of
>   * what went wrong.
> @@ -79,9 +79,6 @@ struct i3c_xfer {
>  	enum i3c_error_code err;
>  };
>  
> -/* keep back compatible */
> -#define i3c_priv_xfer i3c_xfer
> -
>  /**
>   * enum i3c_dcr - I3C DCR values
>   * @I3C_DCR_GENERIC_DEVICE: generic I3C device
> @@ -311,13 +308,6 @@ static __always_inline void i3c_i2c_driver_unregister(struct i3c_driver *i3cdrv,
>  int i3c_device_do_xfers(struct i3c_device *dev, struct i3c_xfer *xfers,
>  			int nxfers, enum i3c_xfer_mode mode);
>  
> -static inline int i3c_device_do_priv_xfers(struct i3c_device *dev,
> -					   struct i3c_xfer *xfers,
> -					   int nxfers)
> -{
> -	return i3c_device_do_xfers(dev, xfers, nxfers, I3C_SDR);
> -}
> -
>  int i3c_device_do_setdasa(struct i3c_device *dev);
>  
>  void i3c_device_get_info(const struct i3c_device *dev, struct i3c_device_info *info);
> 
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
