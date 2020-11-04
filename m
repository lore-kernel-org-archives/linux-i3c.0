Return-Path: <SRS0=k7kV=EK=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CBBDC2D0A3
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Nov 2020 18:35:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC5722076D
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Nov 2020 18:35:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Texyvwkt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC5722076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gjTrVVAyMB136jC80HzEI4Ft0pzmIKyQCjj94RrzA5Q=; b=TexyvwktvNftWqqqvScp7aEe3
	KAcGwS4AUJ89j1Mlc75/TR7S0ZPzlHi8lp8AcCZe58YpOWUqkBNGpzzi0sSozRcHIySFKijhpeUnm
	uffzEERF6EfRAiMGu+CWukybmMFmyLeKoWbQuCZ1VrAeRwZ2v1BO9CTbvGcJwuR5+jTC3tfKCUMaE
	a3s05SX9zZNXP693D8rCUehnHZaRu9cjEVBjRiZB96rd1rDui0jDYczQtaiaqci5S/oKrhR7y/vIV
	nFoxNY5HTqvk9kAuM8ZYUjGZ6mnluNVpLAAjCvtZvUMZNU8RMQCSG1KHTN4c8TNu2pCXuLd3cRd88
	NSmPeiRxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaNce-0001aV-Gk; Wed, 04 Nov 2020 18:35:04 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaNcc-0001Zt-9W
 for linux-i3c@lists.infradead.org; Wed, 04 Nov 2020 18:35:03 +0000
Received: by mail-oi1-f196.google.com with SMTP id c80so11688764oib.2
 for <linux-i3c@lists.infradead.org>; Wed, 04 Nov 2020 10:35:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+Pu+qC55UB5YlipKgMufeJmLLgPD0BKUpqLwOtd0Zyg=;
 b=ELebIiThb2ZR9AOEseo2J0BIQnx0SVAXAzFoJSV/b/x+D5hgpC7/thvNv6pDJHesf3
 0Hj1UUKRuY4XFWvvstV32yEPQAA/QzDugP1CM4vteLd0KLOn1PraubLaaP82tCysXpON
 G0cR+LwSADjhIUSB6XKeCSR6Gc21Ydkq66C43NfEGMbW3SMNx8yM1W8t7+35oBmpwI/+
 8aKpUD0OR3vEVcpyFNaD629Cdi92QliEl7frCPO+qm6rQYfVCINily8jVA+gSP0v5Euo
 sUuj8O2ZxyH2gOgQSOETC4Vi3j41bw13hKLU6VWYSm3RfKWLmU1EBpGp6rx0M0DSI+RF
 SyRQ==
X-Gm-Message-State: AOAM530+AJg0zbFp8Ork7sHkTsil6Yj7Kzl36/2dpqkrdI0VSSLAOMlX
 xsz4gxSbpdNayGVinqhBVg==
X-Google-Smtp-Source: ABdhPJy33XR8jM2PpPlqT8iGDxV/vuCiTtd1LjvEqTOvE1BD4X7txBXlvRJjIj317Uo7shb8QwIuBw==
X-Received: by 2002:aca:f188:: with SMTP id p130mr3162756oih.106.1604514901257; 
 Wed, 04 Nov 2020 10:35:01 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t29sm678444otd.51.2020.11.04.10.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 10:35:00 -0800 (PST)
Received: (nullmailer pid 3918481 invoked by uid 1000);
 Wed, 04 Nov 2020 18:34:59 -0000
Date: Wed, 4 Nov 2020 12:34:59 -0600
From: Rob Herring <robh@kernel.org>
To: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH v3 1/2] dt-bindings: i3c: MIPI I3C Host Controller
 Interface
Message-ID: <20201104183459.GA3917393@bogus>
References: <20201102222220.1785859-1-nico@fluxnic.net>
 <20201102222220.1785859-2-nico@fluxnic.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102222220.1785859-2-nico@fluxnic.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_133502_391375_4AF5CF42 
X-CRM114-Status: GOOD (  13.66  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Robert Gough <robert.gough@intel.com>,
 Laura Nixon <laura.nixon@team.mipi.org>, Nicolas Pitre <npitre@baylibre.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sakari Ailus <sakari.ailus@iki.fi>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthew Schnoor <matthew.schnoor@intel.com>, linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, Nov 02, 2020 at 05:22:19PM -0500, Nicolas Pitre wrote:
> From: Nicolas Pitre <npitre@baylibre.com>
> 
> The MIPI I3C HCI (Host Controller Interface) specification defines
> a common software driver interface to support compliant MIPI I3C
> host controller hardware implementations from multiple vendors.
> 
> All that is needed is an I/O area and an interrupt signal;. The hardware
> is self-advertising wrt its implementor and implemented capabilities so
> there is currently no details that the driver can't figure out on its own.
> 
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> ---
>  .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml

With additionalProperties added,

Reviewed-by: Rob Herring <robh@kernel.org>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
