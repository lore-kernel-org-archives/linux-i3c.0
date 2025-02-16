Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F48C02198
	for <linux-i3c@archiver.kernel.org>; Sun, 16 Feb 2025 15:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=3buZ6RU5waQT3zONGDpiYwM0mSJsrUVx7qLQwC+EI2M=; b=yEYEWcHjy6smtI
	JSTNIv7+naQ5+FlOtOlmJM6lbuAp2ZdREXrtlnWBTZ2wMyyVEXHNuKCyrx+FUT5B3I4WC10dqHi8I
	tNzTWTOP9bS/IPmyqJetM45sU8qnB0tWhwcq67Zrqy/r7Ego9J17ZrsNBuaMbPTp+yRMRCHSH5Bz7
	7DzxzJHxjtQSXoS/XFSVUiFn0f4KY66tNsJB2dF7VKSO7Gp3OLF66E51eCBTzQnnw4XqVRkLM2hkd
	gOUqw2pTi+DZnKfTlB5rYTjNO4Tn+eRgEF+YPSHDHDOQ0fSVtcurX0gVTG64jVVyOrFA/sPrE1Pmu
	/PI7YLPbgA6E5tgMl8oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjgP2-000000020NK-0zuH;
	Sun, 16 Feb 2025 15:17:52 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjgOz-000000020MM-3mwk
	for linux-i3c@lists.infradead.org;
	Sun, 16 Feb 2025 15:17:51 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4396f579634so5738325e9.1
        for <linux-i3c@lists.infradead.org>; Sun, 16 Feb 2025 07:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739719067; x=1740323867; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YbQwwhKUHLPVXLI0Vv9AzeMpozb4oJ2Fj9hVMvs5SG8=;
        b=U2PCyLa7qTiT/H5ARxovo5v8W7QSePyTlQSASDi4lGkEOAa/WlSMwAS1aSGKYmR7pF
         7blBRK3rtMmYpcqEXanKSSMV4qed1Qn9tImk0cOyGIPaeuO0EfPEb2izxNGFznll+FU0
         09aCwPXTs9HSiM/e/JHNm7yXX9hj3MYCxOnob4yB9Rm0oMLqAHGBBLT8S4n6woJ6TUxZ
         Vy0ec7x/BDpdaJ+8pFqxozR4s3EW+owgNbIzxSifXeW30FGoA/L9UaCcYvTBVNZkuRR6
         RHublcsZ5h3DjSMEz3GikQqa6rVBUsXOhTIIKtB5g04i8De0iioPsWDpvBU+Llv/fnJh
         aAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739719067; x=1740323867;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YbQwwhKUHLPVXLI0Vv9AzeMpozb4oJ2Fj9hVMvs5SG8=;
        b=kWRl58IZ7X86jRFk1dxISMrRJ4kGgtMwuqYcn1btgShvzlRbUFSEEaPmuoGxstb5kP
         +rzbQqUkfXCtHsoPmFdTY19jKODD0zEhGdiD3u42BrE4Jp/SKBwIXTNa7Qo/GcubEBPI
         QCpNdvke/t09AG3E1llRb6t6XHEJ1N6eqU4jBFJ+n9/7bYhJHWqcPQUhhiE8pau1O9iD
         nsGROZUbGb9fKlIvuAOrZGPbvZowIH1REN/FENxP3xpuNCXRiizL6obgC3atIPyX3l9d
         8Hcx2ZRw3v/Ypzyp/sy09EExTF1pEz1u5aqBtp2JLvyKSDDS76UbX54jzCcXoOD5/OrV
         kvNg==
X-Forwarded-Encrypted: i=1; AJvYcCXqP0BAKDQb6LoFMBQCC9PfobZ0DgOj0TjDoyfBhi52mZZmCv6ywHDDTs9Qq3owFdnmz8Ygax0A868=@lists.infradead.org
X-Gm-Message-State: AOJu0YwVbmAf7uMBfNy4fsRM/QEh5nGWfzPn6yzYNiU5SKxlnuiyXjCb
	yev/H1HRIE4G/VdOhy+Ktd32bt7KZNMjkzyO4j3GlNHoEnzJEMmdJH/PokrwmwIb6b5FheEjGME
	XvDY=
X-Gm-Gg: ASbGncul95XAE4W8dHSPvl5u+o+nCydoTrFnWMQN2geyWQRvLu4mK4j3O2uUS91dlcc
	71ipnXFQ4559QST/OsLCDe+S+u2hPD88ElkraaLZbf7UTCnC7wMAoz/rnvfdlOfu7NkWXdTznCU
	STPV59hIumN3r92ymLrDeKx3LLF43pXVXtG1+EvlBv9JGI9LLfKr8uoLPq5knz5bn4u2apJJwJh
	1kJI2NqhhYufb1PwRt4UyBZAv4ZGWxz29NsaI6WvlM7Orv4dmh2IAH2c27x+9u9dYUQz4TVJ21o
	ZJdNcMrzARFW7oVkKt4o
X-Google-Smtp-Source: AGHT+IHba5OsEKpH0SAKoQguascZ4LCu5c9cct1nGkEcKfLXS7OVh2ZSdoz/EJAhMNTP6xp8PUBB/A==
X-Received: by 2002:a05:600c:3b92:b0:439:31e0:d9a5 with SMTP id 5b1f17b1804b1-4396e733555mr58754135e9.22.1739719067151;
        Sun, 16 Feb 2025 07:17:47 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4395a1aa7e8sm128915535e9.26.2025.02.16.07.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 07:17:46 -0800 (PST)
Date: Sun, 16 Feb 2025 18:17:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, shashank.rebbapragada@nxp.com,
	Frank.Li@nxp.com, Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: Re: [PATCH 2/2] drivers: i3c: Add driver for NXP P3H2x4x i3c-hub
 device
Message-ID: <c4f99322-ed21-4fdc-a55f-b02bcafd5e5f@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250212132227.1348374-2-aman.kumarpandey@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_071749_959665_2ABFA32F 
X-CRM114-Status: UNSURE (   7.58  )
X-CRM114-Notice: Please train this message.
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

Hi Aman,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aman-Kumar-Pandey/drivers-i3c-Add-driver-for-NXP-P3H2x4x-i3c-hub-device/20250212-213659
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250212132227.1348374-2-aman.kumarpandey%40nxp.com
patch subject: [PATCH 2/2] drivers: i3c: Add driver for NXP P3H2x4x i3c-hub device
config: i386-randconfig-r073-20250215 (https://download.01.org/0day-ci/archive/20250215/202502150815.xfIJk1kS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502150815.xfIJk1kS-lkp@intel.com/

smatch warnings:
drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_common.c:412 p3h2x4x_read_backend_from_p3h2x4x_dts() error: buffer overflow 'priv->settings.tp' 8 <= 8 user_rl='0-8'
drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_common.c:572 p3h2x4x_of_get_p3h2x4x_conf() warn: inconsistent indenting
drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_common.c:771 p3h2x4x_device_remove_i3c() error: dereferencing freed memory 'backend' (line 775)
drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_common.c:902 p3h2x4x_device_remove_i2c() error: dereferencing freed memory 'backend' (line 904)

vim +370 drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_common.c

5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  392  static int p3h2x4x_read_backend_from_p3h2x4x_dts(struct device_node *i3c_node_target,
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  393  					struct p3h2x4x *priv)
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  394  {
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  395  	struct device_node *i3c_node_tp;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  396  	const char *compatible;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  397  	int tp_port, ret;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  398  	u32 addr_dts;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  399  	struct smbus_device *backend;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  400  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  401  	if (sscanf(i3c_node_target->full_name, "target-port@%d", &tp_port) == 0)
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  402  		return -EINVAL;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  403  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  404  	if (tp_port > P3H2x4x_TP_MAX_COUNT)

Change > to >=.

5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  405  		return -ERANGE;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  406  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  407  	if (tp_port < 0)
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  408  		return -EINVAL;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  409  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12 @410  	INIT_LIST_HEAD(&priv->tp_bus[tp_port].tp_device_entry);
                                                                                     ^^^^^^^
Off by one.

5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  411  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12 @412  	if (priv->settings.tp[tp_port].mode == P3H2x4x_TP_MODE_I3C)
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  413  		return 0;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  414  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  415  	for_each_available_child_of_node(i3c_node_target, i3c_node_tp) {
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  416  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  417  		ret = of_property_read_u32(i3c_node_tp, "reg", &addr_dts);
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  418  		if (ret)
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  419  			return ret;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  420  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  421  		if (p3h2x4x_is_backend_node_exist(tp_port, priv, addr_dts))
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  422  			continue;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  423  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  424  		ret = of_property_read_string(i3c_node_tp, "compatible", &compatible);
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  425  		if (ret)
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  426  			return ret;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  427  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  428  		backend = kzalloc(sizeof(*backend), GFP_KERNEL);
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  429  		if (!backend)
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  430  			return -ENOMEM;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  431  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  432  		backend->addr = addr_dts;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  433  		backend->compatible = compatible;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  434  		backend->tp_device_dt_node = i3c_node_tp;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  435  		backend->client = NULL;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  436  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  437  		list_add(&backend->list,
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  438  			&priv->tp_bus[tp_port].tp_device_entry);
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  439  	}
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  440  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  441  	return 0;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  442  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
