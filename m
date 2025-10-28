Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD1FCCD1BF
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Oct 2025 15:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=64aI7DD8ELL/mnXmA/yWUYZW/BR5UZ2/1Nb51Thc7uc=; b=5Fglj1X+Jrhrha
	aJR4PgUc20FD5zjkwg3EvmP+i1hiDRWnoknIkBm+PyZHO4j0WZSm1Y3rQByI7+DnNlHaBcqS1uHFg
	DpHKS5e9dewXQokz9nIJD7lZHuuIWCgtFhVGRIEXe869qI53+Vm5bM6PB3HF5AdshMPZfkgsmpWUn
	EBfxNsxHbAFC3lQ21nNoMH87Y5jPGwBBxAF8tRO0lFoNFm1Re0Zk2Vo70s2syvz7lLUVVQwUMrzao
	Wv6ujdFvq3Ome2S7skJc2MacbTBGQRnfyaZ6mQ3FuZm75OFNyNQUHJ6sLgaqP7u0JwpNhYCL2i3dD
	rk2zgfpBRKrDr4fZM73A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDleh-0000000GBVi-1MZk;
	Tue, 28 Oct 2025 15:30:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDleg-0000000GBVZ-1mec
	for linux-i3c@bombadil.infradead.org;
	Tue, 28 Oct 2025 15:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NxRG+6Pho2gqh+4Q9HbMHt6ljAWQLQ6AqeZiXpRBEU8=; b=X1i61U/sKFZ8K7ZiXv5nSbc9If
	86W/wdHplKCA7vQPtQGtVMsnvkbf8x/6sf7f/vd+ztDCfBkLuyb+nE1HqJyIIcDidxmqilK3syGDM
	VeRv5q059+OZWttrq4FrXfa5SnlXo9GE2loYrq4z2mAmUnlI/gTZddoAvkC9oIS8CaJwAsEmz2c5K
	EadDB3rFfTc9J/K9rBSPE0ZPoWKVA2V9VyLw+RzJKJ4o7hDqgAiMUvfN89jpVMyxJqfBeB1r6p36O
	3ueS7FeC4wyQAjVV2Ar2iWFe1xf7v6VNfuMy9bvhN5Wfk6JgestjmdqsAasngX+FAaL0hEM19QCyO
	s1vBNtRg==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDkmu-00000004fVw-0AO9
	for linux-i3c@lists.infradead.org;
	Tue, 28 Oct 2025 14:35:05 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7811a02316bso4483121b3a.3
        for <linux-i3c@lists.infradead.org>; Tue, 28 Oct 2025 08:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761665433; x=1762270233; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxRG+6Pho2gqh+4Q9HbMHt6ljAWQLQ6AqeZiXpRBEU8=;
        b=NwYquPxSihFYgE4wsk+5agOz2G/lsqOsEka7SpygiUbXIzHJlx9MPWPS05GCz1675W
         dwpaPRr+HCD0kWY+i1JYlLDnU3l9f9UrTc+Y/qEby+xcgGZmlzSG/Mo32iD/nfnbKTQc
         urG6kEbRt51rBRSqKeoOx0wn/svr0OJZn7A9qUxPg+/pgCK75MqE2JbEelJ0GCwNcXP1
         Qi3umT7XdVRQg02VGrsHGpS7I6vR+89cwaWkJ5KsrpJG0vzhBVLoRCvv5x7YwYwruRm5
         2HZoyFxFnj0pEsZdWJlyep+sNjFsFWQuBCdcKhpvSwSiwOP+8aosHlySY1tz+fYZ661E
         sqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761665433; x=1762270233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxRG+6Pho2gqh+4Q9HbMHt6ljAWQLQ6AqeZiXpRBEU8=;
        b=Ek6iVA5tXp7EWqghmNR6XQQ9x/+q7axwsgG5sOyEgB28P9BmwlUy3ZO54BGYEXdACB
         4cQpZ1120jpq/99IYICINTy2M/MGQ7hxZip16D3VDQRRUF1Z/KhjTtvWR4L7X8n43tJ1
         1KEVanfc6ek0L3xSh5q78PPeHwqoE47E0Yy/mMfirR9XpjXJziA9exBmtxlxJVzy3WQR
         km44/N7BgRHpPnnBROrw5ZrsVdclYpGnG3jsl+zAn8Z1FXwefiCTpgs3g99YSHAwHeXL
         LzsD5iAIEihNLA2ryEs2evmtrTh6SO/wKdsZi4WFHPVVs9p00Le0jsWcfD8DinWRqMx1
         7AWA==
X-Forwarded-Encrypted: i=1; AJvYcCVgcVnKiiHJbB6YHDVkl1pIxeVrEYZC9Qy5LW+jMwFFvi8IkRKsUnSR9sRi7ZIc1wx0RuFqhu5W+s0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyGoVONOKP+Pf1r3ISvLZUeTfpsIAeh9TcCV3N1p/R53LCKGyqy
	wWxTQGM+z9UsxhG1Eozx3UDyYTlUBzSkULz6eTe2nsE9LBaAPWNa+sfk
X-Gm-Gg: ASbGncsO5IBDk+iQzL2EN706T/SwwZSEA7wESN02SrD6x0jRTocUKm1ePBA4Nfh9/ks
	xZgy5aRMfHSCwPUOCMj0kJEN30o2iiKx8rfMNgxzTNT2bNtFEy0Mv6+QqqVi2I+i/rgZmNxiUIw
	XwhDQdwpEr8CSq2J6EDg+yx47pqgL5IrhhA7DQ9Ki6nXcgcl3a+cgaqOJZNMiJNJiYuaTthx8oa
	g7bTY+yi//D+pDfRnGty50PnIS8omKqxD3SHPOcn1IttSHLI2AHjcuSZXL3EeGWtOhJZEUHjeDS
	fkxvWiudPLdQoedK6vz5gUkRoaHL4JO226q6BR+i9/4qeczN5jEPJQMhgb9aFB3hTQJswANL9J8
	S3Q5SKpBOLZn9G7CsD37tlQd5IfscwhfwHLHAIpjdzhNg/6G5lZi8lAW/8XPMMUI4O4CsEDGUye
	4sk5FCBKQCOCke
X-Google-Smtp-Source: AGHT+IGPgJpaXpS+qGfCVwjy5qKW3g9pioh78AOdOiTvXDrTwpjB0TQBFCGFxXT+WLbv0GqTWaiN5w==
X-Received: by 2002:a05:6a00:3926:b0:7a2:8111:780a with SMTP id d2e1a72fcca58-7a441bbe4a5mr4578185b3a.2.1761665433210;
        Tue, 28 Oct 2025 08:30:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414011acdsm11958328b3a.13.2025.10.28.08.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:30:32 -0700 (PDT)
Date: Tue, 28 Oct 2025 08:30:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-iio@vger.kernel.org, joshua.yeong@starfivetech.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/5] i3c: Add HDR API support
Message-ID: <c0ee9047-691c-4f5d-a273-333a6bbcd5a8@roeck-us.net>
References: <20251027-i3c_ddr-v7-0-866a0ff7fc46@nxp.com>
 <20251027-i3c_ddr-v7-1-866a0ff7fc46@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251027-i3c_ddr-v7-1-866a0ff7fc46@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_143504_131398_32744E9E 
X-CRM114-Status: GOOD (  28.83  )
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

On Mon, Oct 27, 2025 at 04:08:29PM -0400, Frank Li wrote:
> Rename struct i3c_priv_xfer to struct i3c_xfer, since private xfer in the
> I3C spec refers only to SDR transfers. Ref: i3c spec ver1.2, section 3,
> Technical Overview.
> 
> i3c_xfer will be used for both SDR and HDR.
> 
> Rename enum i3c_hdr_mode to i3c_xfer_mode. Previous definition need match
> CCC GET_CAP1 bit position. Use 31 as SDR transfer mode.
> 
> Add i3c_device_do_xfers() with an xfer mode argument, while keeping
> i3c_device_do_priv_xfers() as a wrapper that calls i3c_device_do_xfers()
> with I3C_SDR for backward compatibility.
> 
> Introduce a 'cmd' field in struct i3c_xfer as an anonymous union with
> 'rnw', since HDR mode uses read/write commands instead of the SDR address
> bit.
> 
> Add .i3c_xfers() callback for master controllers. If not implemented, fall
> back to SDR with .priv_xfers(). The .priv_xfers() API can be removed once
> all controllers switch to .i3c_xfers().
> 
> Add 'mode_mask' bitmask to advertise controller capability.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Why not add hdr mode in struct i3c_priv_xfer because mode can't be mixed in
> one i3c transfer. for example, can't send a HDR follow one SDR between
> START and STOP.
> 
> i3c_priv_xfer should be treat as whole i3c transactions. If user want send
> HDR follow SDR, should be call i3c_device_do_priv_xfers_mode() twice,
> instead put into a big i3c_priv_xfer[n].
> 
> change in v7
> - explicit set enum I3C_HDR_* to value, which spec required.
> - add comments about check priv_xfers and i3c_xfers
> 
> change in v5-v6
> - none
> 
> change in v4
> - Rename enum i3c_hdr_mode to i3c_xfer_mode.
> 
> change in v3
> - Add Depreciated comment for priv_xfers.

Deprecated

> 
> change in v2
> - don't use 'priv_' since it is refer to sdr mode transfer in spec.
> - add 'mode_mask' indicate controller's capibility.
> - add helper function to check master's supported transfer mode.
> ---
...
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2821,10 +2821,14 @@ EXPORT_SYMBOL_GPL(i3c_generic_ibi_recycle_slot);
>  
>  static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
>  {
> -	if (!ops || !ops->bus_init || !ops->priv_xfers ||
> +	if (!ops || !ops->bus_init ||
>  	    !ops->send_ccc_cmd || !ops->do_daa || !ops->i2c_xfers)
>  		return -EINVAL;
>  
> +	/* Must provide one of priv_xfers (SDR only) or i3c_xfers (all modes) */
> +	if (!ops->priv_xfers && !ops->i3c_xfers)
> +		return -EINVAL;
> +
>  	if (ops->request_ibi &&
>  	    (!ops->enable_ibi || !ops->disable_ibi || !ops->free_ibi ||
>  	     !ops->recycle_ibi_slot))
> @@ -3014,9 +3018,8 @@ int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev)
>  						dev->boardinfo->init_dyn_addr);
>  }
>  
> -int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
> -				 struct i3c_priv_xfer *xfers,
> -				 int nxfers)
> +int i3c_dev_do_xfers_locked(struct i3c_dev_desc *dev, struct i3c_xfer *xfers,
> +			    int nxfers, enum i3c_xfer_mode mode)
>  {
>  	struct i3c_master_controller *master;
>  
> @@ -3027,9 +3030,18 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>  	if (!master || !xfers)
>  		return -EINVAL;
>  
> +	if (mode != I3C_SDR && !(master->this->info.hdr_cap & BIT(mode)))
> +		return -EOPNOTSUPP;
> +
> +	if (master->ops->i3c_xfers)
> +		return master->ops->i3c_xfers(dev, xfers, nxfers, mode);
> +
>  	if (!master->ops->priv_xfers)
>  		return -EOPNOTSUPP;

i3c_master_check_ops() already ensures that either i3c_xfers or priv_xfers
is not NULL. The above check is therefore unnecessary.

That is not a new issue, though. Maybe there was/is a reason for the
additional check, but I don't see it.

>  
> +	if (mode != I3C_SDR)
> +		return -EINVAL;
> +
>  	return master->ops->priv_xfers(dev, xfers, nxfers);
>  }
>  
...
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index c52a82dd79a63436c1de6a01c11df9e295c1660e..7e22f9d2a2ca3f4ab808db50f809efd192c795cd 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -474,9 +474,13 @@ struct i3c_master_controller_ops {
>  				 const struct i3c_ccc_cmd *cmd);
>  	int (*send_ccc_cmd)(struct i3c_master_controller *master,
>  			    struct i3c_ccc_cmd *cmd);
> +	/* Depreciated, please use i3c_xfers() */

Deprecated

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
