Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1953C87FCD
	for <linux-i3c@archiver.kernel.org>; Fri, 25 Jul 2025 09:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1rehfJeWpeJxH/87ARS/MfZ+wdAikGEQho6lPxeGaAI=; b=udDD0+jnc3tyRy
	G+Env4Wk/hClC4Xl1J3U9SQupWDqeMtug6g9KXeolNncA2AZdsPeuzN00zQ21F07ah1bXoDmZBUm0
	CCaL4+5ZqH+lGV/CVPLuozcaRTsOcJOnJR4fmNrq6HTSMIxmtleIdvX0li758rdrxhMaFeGK/4ngH
	CGwJXGq0vfHEEQi4QURWuxySNC7meFsfMjvyVp1oHGJKxufdxgllPYsMVeIWj+Ordvoxx3whiIR8k
	Obg9ruWKQJq0BEM7sebVvyxNoqb4I9i77nb7lpQaez1uGUOMqTd2G+R0qWZjtq1v4a+GjpO2ArWWd
	QgFCNJPbJsGNO/Vgh/bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufEeJ-00000009RsB-1es3;
	Fri, 25 Jul 2025 09:23:31 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufEaJ-00000009RaX-0KVH
	for linux-i3c@lists.infradead.org;
	Fri, 25 Jul 2025 09:19:24 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-235e1d710d8so24861905ad.1
        for <linux-i3c@lists.infradead.org>; Fri, 25 Jul 2025 02:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753435162; x=1754039962; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eEpniKk6bwNpegBFAtBP/sJldjdZjYBWcx4NScAsS2s=;
        b=N/oRMw4RgtBmNSsqwzWiSK+4q0pUvDwNptXomD2zZlQIx9mBu5G7ml7IucKlu8HCu3
         NvT0EYaHpLXmCGflW58lKIpWhwQfU/7IusSANi3nyXXFkVNyp3xCmR+YobL6pYiSk8ay
         3uM3f5L4h4nnrEfmVHWVz9xrgLDMzkc3A9nAKuinEAGdPM8dfwwmdAZHZpnHzid9crc0
         O6EpsbZ37Gz/HWpKY/OMUlMGj855i7uGy5osYFy9LVV6BZm6x1T0Vs3+lhRvvuZM+ZPk
         EyNI2b8qn9Kvr68XwOQrrtyVIA2SvIt3ICTawyqKPiqFL9MysEYXDb82TIKPHjz02XlE
         NUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753435162; x=1754039962;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEpniKk6bwNpegBFAtBP/sJldjdZjYBWcx4NScAsS2s=;
        b=Qmj6a9PODBA53VcZr6YAtT7+Xta3DvTEzHONc4V6k9CgMM3skdums4/mZRwyDLy5eN
         591vME5TGlUHTk5Peub/CwiCC15XlggFrOg3NIn226nKfI7grmM2M6TV5FH77ud5ySAI
         /Tm5+J/ZDfnqvXA+buus8fj1iyhX/D88BOrkTMh6SEDXmcEraOOFVpivypzVgMYCJo0l
         BDAJr5Pjl6wHSnn1xFR2OEnrLLPENeWrDqz7j4aRqEFIs8n9uvyXg705nqu4pu0MNJXK
         /b4t5mp4guXU5MMwFoPku3gNgh+30nH6DJ9J0lYoIjIdyiR51/8JiD1zgZDp3NvNoqGz
         4syw==
X-Forwarded-Encrypted: i=1; AJvYcCUl3/DxA5ho7a1/f+tJ59VtGt1Q+osa7YRt9HeHkad3wO0bgLVF8U8AZWV4RisrikqsX+kbsRdB0W8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOu9Su2jfalWWZjPlJBl4mMg1YqQv3WfXd5MJtFthAE59shU7w
	SxOgoCWSC2kM/mbmXQpr+P7ndNvDFmiMl7UEcEwwevpCc4VOMDhY5bGE
X-Gm-Gg: ASbGncvnUldbG39wNo/BtDCoGHVbtnvlZnH4sEc9rYMeDXD4xhhhcUAwIpih0yQdlXL
	ufIRuPzxEFjzDxEaBxHg+4RGY7YB88jdUUjSAzfijLQojHyxHvQ8jcJsczBzZdGMqHdMtK/eDNv
	F996WY1O/XYA2DgwNZOxL2MCkduzf5aalT8YR4+Vj+NudkoXsqOVA57ZBwfH8C8WSfowaAUo4bf
	o+mcaOgMv/ty6GnP0UtbkpL34LJVj5pHD20SfUXAB4NnPcT4gkV9ZgICON422Nx4hmFnkSh2Fd9
	nxtCEzOYZem4ifPkpyxmXaD9IY0MYHjGBHuIfWLIZygOOySnqjNZq5YSjQDPrbtEj0MKWHZv0vs
	0wCFNo6+Xe/hqG+x6lWJSvTVzLzFyNJtnKcxWz9rzmXhslXhQadr1qa1076zgDNTNg7awVh4=
X-Google-Smtp-Source: AGHT+IEKq9+eEVVyjxgPcBMRnLz9mjbzHqV86DqOgNty+0gikfAgM6ne05GzgqeKhk3hSUsJvOF/QA==
X-Received: by 2002:a17:903:2345:b0:23c:7c59:c74e with SMTP id d9443c01a7336-23fb2f04695mr17927495ad.0.1753435161713;
        Fri, 25 Jul 2025 02:19:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48dc0b2sm33240835ad.132.2025.07.25.02.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 02:19:21 -0700 (PDT)
Message-ID: <8cf89734-0663-4453-a079-8bdf40625746@roeck-us.net>
Date: Fri, 25 Jul 2025 02:19:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: fix module_i3c_i2c_driver() with I3C=n
To: Arnd Bergmann <arnd@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250725090609.2456262-1-arnd@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250725090609.2456262-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_021923_125637_5F4D73A1 
X-CRM114-Status: GOOD (  20.32  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 7/25/25 02:06, Arnd Bergmann wrote:
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

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   include/linux/i3c/device.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> index b674f64d0822..7f136de4b73e 100644
> --- a/include/linux/i3c/device.h
> +++ b/include/linux/i3c/device.h
> @@ -245,7 +245,7 @@ void i3c_driver_unregister(struct i3c_driver *drv);
>    *
>    * Return: 0 if both registrations succeeds, a negative error code otherwise.
>    */
> -static inline int i3c_i2c_driver_register(struct i3c_driver *i3cdrv,
> +static __always_inline int i3c_i2c_driver_register(struct i3c_driver *i3cdrv,
>   					  struct i2c_driver *i2cdrv)
>   {
>   	int ret;
> @@ -270,7 +270,7 @@ static inline int i3c_i2c_driver_register(struct i3c_driver *i3cdrv,
>    * Note that when CONFIG_I3C is not enabled, this function only unregisters the
>    * @i2cdrv.
>    */
> -static inline void i3c_i2c_driver_unregister(struct i3c_driver *i3cdrv,
> +static __always_inline void i3c_i2c_driver_unregister(struct i3c_driver *i3cdrv,
>   					     struct i2c_driver *i2cdrv)
>   {
>   	if (IS_ENABLED(CONFIG_I3C))


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
