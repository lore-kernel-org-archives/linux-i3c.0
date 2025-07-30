Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CB1C87FCA
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Jul 2025 00:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ElyrAeDNMULzfIYJWE5yd69SFF5JcDQqbcSiJuRKiE=; b=jT6ETHL/rL1XYJ
	b8pIMxgY5sy7aGWme/8qW0yRrjqDR1hisEAtoEJEY1mn6qkJjuvW/0davvzR99MsSL+iTshJhQ+1A
	uUy4F1ZJGbeefNmOXnDlUWznXCKI+Id0W3qwyFZu5q9jxaDYJbReKBUZuQvW/dIJm3pk9KlCTR4Pr
	wgmnveKRmtbMsDgPXmsKvLVHgEqqM/t748Gd6Q31Lk6iZSIrWRoadTTvg6hRuVaXSf8glYWCDNiD7
	D2kVD+x1bSsGKxiSddwgQwrkMJxzBY5cdqLSZra65XavBgYPzGHgkHaAUgzw2EY+uRQt7yrUQsqQr
	alE3Z4V5883py/Wi1UGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uguTZ-00000000MiV-0sSN;
	Wed, 30 Jul 2025 00:15:21 +0000
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uguQP-00000000MOZ-1Kjd;
	Wed, 30 Jul 2025 00:12:05 +0000
Message-ID: <06e91cc6-ee85-4a90-b9e1-3d688b69c0e0@infradead.org>
Date: Tue, 29 Jul 2025 17:12:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: fix module_i3c_i2c_driver() with I3C=n
To: Arnd Bergmann <arnd@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Guenter Roeck <linux@roeck-us.net>, Boris Brezillon <bbrezillon@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250725090609.2456262-1-arnd@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250725090609.2456262-1-arnd@kernel.org>
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

On 7/25/25 2:06 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When CONFIG_I3C is disabled and the i3c_i2c_driver_register() happens
> to not be inlined, any driver calling it still references the i3c_driver
> instance, which then causes a link failure:
> 
> x86_64-linux-ld: drivers/hwmon/lm75.o: in function `lm75_i3c_reg_read':
> lm75.c:(.text+0xc61): undefined reference to `i3cdev_to_dev'
> x86_64-linux-ld: lm75.c:(.text+0xd25): undefined reference to `i3c_device_do_priv_xfers'
> x86_64-linux-ld: lm75.c:(.text+0xdd8): undefined reference to `i3c_device_do_priv_xfers'
> 
> This issue was part of the original i3c code, but only now caused problems
> when i3c support got added to lm75.
> 
> Change the 'inline' annotations in the header to '__always_inline' to
> ensure that the dead-code-elimination pass in the compiler can optimize
> it out as intended.
> 
> Fixes: 6071d10413ff ("hwmon: (lm75) add I3C support for P3T1755")
> Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  include/linux/i3c/device.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> index b674f64d0822..7f136de4b73e 100644
> --- a/include/linux/i3c/device.h
> +++ b/include/linux/i3c/device.h
> @@ -245,7 +245,7 @@ void i3c_driver_unregister(struct i3c_driver *drv);
>   *
>   * Return: 0 if both registrations succeeds, a negative error code otherwise.
>   */
> -static inline int i3c_i2c_driver_register(struct i3c_driver *i3cdrv,
> +static __always_inline int i3c_i2c_driver_register(struct i3c_driver *i3cdrv,
>  					  struct i2c_driver *i2cdrv)
>  {
>  	int ret;
> @@ -270,7 +270,7 @@ static inline int i3c_i2c_driver_register(struct i3c_driver *i3cdrv,
>   * Note that when CONFIG_I3C is not enabled, this function only unregisters the
>   * @i2cdrv.
>   */
> -static inline void i3c_i2c_driver_unregister(struct i3c_driver *i3cdrv,
> +static __always_inline void i3c_i2c_driver_unregister(struct i3c_driver *i3cdrv,
>  					     struct i2c_driver *i2cdrv)
>  {
>  	if (IS_ENABLED(CONFIG_I3C))

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
