Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E393BCD98CE
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 12:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADCFvzHX/lwCi8Ct+XfraqTXqIY8RGdDTQNYhUMOCKQ=; b=dcI8b9lzHu2eCL
	s7fXQ8C2u695Zj8dWj/wHkbvTvRg2cQhuja50e2GX7Tfx2Kb6/b8WN7YNV5bl+6BmHHTrRD0EIwCw
	5bvVoFC+V1DkD1sR6yPURfhBfdWc4v+mmkt+0oWoTcookhQvzRRadSVqcmSqLwNH4kamHl7VsNhNR
	anob46YsPUMAap8FAF9bb1QFawK8tZlqmfYC1zmxNAkZdw+ldq1twhKHaohJMi5nhSTHYUvUEvBI8
	z2BU/EZI9lGB3t5/yqY4cf93xg8l2CXvDP69AQxs61FrITbRGLOITzFeIE84S1RwTOPuKsa6lp8V6
	yGBVWcEWudWzlpWFZj/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY0hc-0000000ArBG-2rO8;
	Fri, 12 Jun 2026 12:09:36 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY0ha-0000000ArAf-2YJW
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 12:09:35 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490b3e03939so7843645e9.1
        for <linux-i3c@lists.infradead.org>; Fri, 12 Jun 2026 05:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781266172; x=1781870972; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=KfGyX/QinnMuisy5V/TZ4GlcvW6yAzZU5ot0B9/Qp+M=;
        b=GVbo1Mnxmf4NVZbk9qF10C9YI4OgYNQvwhVwHHXfbPqrfES7Nwb+Qrewm/gV78/wjQ
         iNEajivQLAudhsJ2M2UyT9R92yhjFCl86+NX17r2S8cKg02N0Vg6LzHBnM0DG7ZobzOg
         m9s9sOJ4quGI3E8BjWW0m9O/qsDHA9J0KCNHlZpLaNBqP50QQS9DR3bmbMNHL8L81J09
         gEEWDOi08q6YCdjFj1el4e76bVFkbMd9vhxvoq+Fvt8WUVJXMFJ2qgYWNoeZSZsnf0kN
         1FQz1pREkuPyHHdHjRcVSFtY0tGIGOqPjqc2kbjOVdYPBoSTRSxYvoxhZnN1eXD9A0Qr
         oc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781266172; x=1781870972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfGyX/QinnMuisy5V/TZ4GlcvW6yAzZU5ot0B9/Qp+M=;
        b=aes9gD/3iQlr4CTyNCRUqeWT4D3Hne992IL6L4Vo4g7rngQk2zzXGCE0qUbDAihHVu
         XxnOgPVWZIgfeNGusPjlDITNn8KeV1X6En9zmfzTbC3MjxohDroYdSawJd5s+GH1LcvN
         8ZxpDFpom0lX3Tw6BOgaw/+5LSAs864RXiQu5OiEeZs8zaIqOYg+qYZ+29igX2OCAcyQ
         A7vdDPLBXD7lY06oYsm7M5i6rXKalUnRCWluF88VjKNyYxATPz6EGn5H25XW3EasL6k6
         cwo37ZK+grbdlOUWE2Kt/QA8dOedbrvDs3eJHZktMFnpGlJlhHrRalv/sWf7zCO2oRdT
         LBLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/GUPXSnLLsGdUl5M0XkXh0NyNcK/aT6SLbGhxkh1hfwlBWdBspH7iJjcgFVcKUsi84GYVKsq9+VD4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+G1zPvONmoqZj/NePE0ml5nfymnmZVnVsJbV7MeefmEJT9EYU
	P61goUJFvbFLDer/D28gAkiILvWh1vEEfgZzb0nG0Aa9Pg9r1f+QSQ2G
X-Gm-Gg: Acq92OHif1WsnnBqMNCMSnGHQ8nrHe/KYe50ibgM74oNPdWmMjAX+XE0iUKeg5yho8Y
	BirABMr6oBIwETKk5ofkDik1BtQicng+9COiD0wDHshl+Ca1BhucSM9Xl3HJxdu0bJ8o6bq4IgM
	9VqPjcJlprQXYI9sfxpDKAyx7xGx/KBISIuhkW1a9mT3WJjjltoGJSAUOQ934o6KdncogJPiY7X
	5AdBPSVjE/4zhPl6t/8koZiZjhd1Yzu8VHaMjcNFA3DNDsdMv+RT/mjvH+ks8ouc0s6QTcpsysf
	mRfjCNgLQCj6c7cLV6Kjv6ksqzgU2N+2Gi1FDSOXfASNPKvxCIuqOuyhYEcpvi6V3SiEu/knJrP
	dL/sGPcHPEqSKWRk5w7fJl5bwE0cHFwa2NpuiRB2k2CFPpRGo1DWlivFsVmlr+Q1/SKD0yi1gPS
	2F08H1c2F3CG8kAG02u+jeaD0300PtUM6A10qn6ALu2NKnmANZE81sCY82cxTEZEPQMBO7mkUsy
	Ds9CCxLPMBuEug4XNo=
X-Received: by 2002:a05:600c:3145:b0:490:9dc3:3483 with SMTP id 5b1f17b1804b1-490ec480f88mr26461605e9.2.1781266172176;
        Fri, 12 Jun 2026 05:09:32 -0700 (PDT)
Received: from [10.128.10.215] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea94f5b0sm42232815e9.1.2026.06.12.05.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 05:09:31 -0700 (PDT)
Message-ID: <76b41187-15b6-4ebb-ace7-186a8619b67e@gmail.com>
Date: Fri, 12 Jun 2026 13:09:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 7/9] i3c: hub: Add support for the I3C interface in
 the I3C hub
To: Lakshay Piplani <lakshay.piplani@nxp.com>, linux-kernel@vger.kernel.org,
 linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com,
 krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org,
 Frank.Li@nxp.com, lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com, priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
References: <20260612111816.3688240-1-lakshay.piplani@nxp.com>
 <20260612111816.3688240-8-lakshay.piplani@nxp.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260612111816.3688240-8-lakshay.piplani@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_050934_658088_48B7383D 
X-CRM114-Status: UNSURE (   8.80  )
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

On 6/12/26 12:18, Lakshay Piplani wrote:
>  if I3C
>  source "drivers/i3c/master/Kconfig"
> +
> +config I3C_HUB
> +	tristate "I3C Hub Support"
> +	depends on I3C
> +	help
> +	  Enable support for the I3C interface in hub devices.
> +
> +	  This option adds virtual I3C bus support for hubs by creating
> +	  virtual master controllers for downstream ports and forwarding
> +	  bus operations through the hub device. It also provides an
> +	  interface used by hub drivers to enable or disable downstream
> +	  ports during bus transactions.
> +
> +	  Say Y here if your platform includes an I3C hub device
> +
>  endif # I3C
Hi Lakshay,

The 'depends on I3C' here is unnecessary because that's what the
'if I3C..endif' is already doing.

- Julian Braha

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
