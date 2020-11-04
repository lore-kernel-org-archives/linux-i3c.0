Return-Path: <SRS0=k7kV=EK=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7587AC2D0A3
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Nov 2020 18:33:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2A992076D
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Nov 2020 18:33:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xtlk3hlU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2A992076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uDYwFb/x5hY5gNWFHUYHLwKEU1iEo9XrsfQK5poxSLU=; b=xtlk3hlUMnYag5r0NxUaKRBJQ
	NaeiVGs99M/D4usHljxpmrg9u0i3dfqw7dQYSzNxSNqltk+xEbU++Dkw/noeQNsrPJPNX9B4wqkvS
	xq45FpL8B7QZXI68kXfNdQ23bagExLhXnFzYPyAYOj2+9lKpAknsJIIgxPAW7LvmIRU9jQYjc4de7
	3gAb+/aVN/L6OqDndD0dftuA4BZ3+hk0scJ1ccAkGZjAHLpvc3i3aAtJz0UC8xGkxEDQfMnSiT7kc
	3TaFJob8zHPFV0pbycArW8kuQgXFhB05G94yp/J6LhD1FY0eX5Bn/23s+PNzKv0CMb0IwE9KHM4SC
	x8bCR8TXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaNbV-0001V4-VR; Wed, 04 Nov 2020 18:33:54 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaNbU-0001UK-4W
 for linux-i3c@lists.infradead.org; Wed, 04 Nov 2020 18:33:53 +0000
Received: by mail-oi1-f194.google.com with SMTP id w145so17518337oie.9
 for <linux-i3c@lists.infradead.org>; Wed, 04 Nov 2020 10:33:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5B8qrVPM5BWPGWKAKqWXi/BbhRSACICMp91l8/+DStc=;
 b=K/QaLTbCBVf8bH7nX4fm8gKSrzoB/Zp+AfIP0QwAx2R4M3gRqsv+kfkP/GktPleJp2
 ovslx66rVtPyvSMvKIPknPv0FQ+LZSztJ8h5QlxSwArYP1pSPc7j8bUYVITcgZrweDHn
 zLhkZJrV1uLPOOB2wb4rl8/Q0IiJh6BfpPRzdjF/d779X0ZZ3nKG2KCu+972QzVqMGWg
 O+807XSQgIb9T4dtqXQZrK3U4qelpf59uHsLWbr2Y4mv9nSQXJIq8qWORP2fljfAHBwB
 fzx+1+XxdaErwHFRkkFq+AxSqmxEjsqdeq6cR/lTAE//uDRAW9XASI82olUDR8N5BkaH
 Z25w==
X-Gm-Message-State: AOAM532rBIzsG0juXbxxGDg4TonUmkxhYkT/+JGaEooCH9skkB/p8A3m
 LEM8Y+AlXbZygqlAX8dkWQ==
X-Google-Smtp-Source: ABdhPJwxDIzi261bUymLavG5I63jG80tnCA1Ywh1cibbotgdK7Gt+qG0C0w+PT7DdFE/kr4NwVbz1Q==
X-Received: by 2002:aca:75c4:: with SMTP id q187mr3178584oic.132.1604514828061; 
 Wed, 04 Nov 2020 10:33:48 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h6sm628296oia.51.2020.11.04.10.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 10:33:47 -0800 (PST)
Received: (nullmailer pid 3916880 invoked by uid 1000);
 Wed, 04 Nov 2020 18:33:46 -0000
Date: Wed, 4 Nov 2020 12:33:46 -0600
From: Rob Herring <robh@kernel.org>
To: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH v3 1/2] dt-bindings: i3c: MIPI I3C Host Controller
 Interface
Message-ID: <20201104183346.GC3913864@bogus>
References: <20201102222220.1785859-1-nico@fluxnic.net>
 <20201102222220.1785859-2-nico@fluxnic.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102222220.1785859-2-nico@fluxnic.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_133352_223928_831E580A 
X-CRM114-Status: GOOD (  14.63  )
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
Cc: devicetree@vger.kernel.org, Laura Nixon <laura.nixon@team.mipi.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Robert Gough <robert.gough@intel.com>,
 Sakari Ailus <sakari.ailus@iki.fi>, Nicolas Pitre <npitre@baylibre.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthew Schnoor <matthew.schnoor@intel.com>, linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, 02 Nov 2020 17:22:19 -0500, Nicolas Pitre wrote:
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
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml: 'additionalProperties' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml


See https://patchwork.ozlabs.org/patch/1392544

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
