Return-Path: <SRS0=OcUj=CD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0446EC433DF
	for <linux-i3c@archiver.kernel.org>; Tue, 25 Aug 2020 21:29:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC7E820738
	for <linux-i3c@archiver.kernel.org>; Tue, 25 Aug 2020 21:29:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mc/DUoyr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC7E820738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5fzWAt4dTzrRDR/uLF34TNJnE49rrEuY5udoD7uo0Mo=; b=mc/DUoyrgQQB5VN2ULlHubXTx
	v/tCkyv7jaMquRm06bjoB7LT/KRwnHqoBS4AtzDm0HVLvgQwSsw23SxgodMUep7t5gLE+LwadS5nq
	O7r6o2/5xNgWJNxoBVlHo/mqrW+gxVBmpW04qSSdSNq1oq+wpb/XKXtOZCR8VhtTW6OzwoKyUD0FN
	H9VbqBVsGvtuxhsrISAkGDCeVCtj7mp0WL1Sn1AE0ZyULVMaIiWWfmm2o97j88ASSkFdrzCEtYIfp
	NOPNw7WXrgZ+DswIr/q7AACt1+V21HGgGBRaTUWmxh4jj3/Uly4dgb5NaHvQdztsn/W3WLoF5b9Wl
	G/AA3FwvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAgVk-0005xC-3C
	for linux-i3c@archiver.kernel.org; Tue, 25 Aug 2020 21:29:44 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAgVg-0005uk-Cn
 for linux-i3c@lists.infradead.org; Tue, 25 Aug 2020 21:29:41 +0000
Received: by mail-io1-f68.google.com with SMTP id b16so24673ioj.4
 for <linux-i3c@lists.infradead.org>; Tue, 25 Aug 2020 14:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KC6+KOuevd65Hj+rqbmYtwV5VdmCIsRDB4gdpaWQ8XQ=;
 b=VLKx/gmGqtMQRCoGgudKvkaEjhCUuKm2stEDCFIHsvUZn9r/GBvkOwMA7m8dp+slz0
 9GPhbCS85MvgTtJd696umNUtbQ069vOLdcQK2IatkSe0wCvpMv0K6w0E/wsbVMNxNMSW
 PW7GZyQLQUt0jtGC2dMKLCrmYugcnI5glU+2Xf5xPBEsB3HBeIQa2jlcCrmGGiXznSAD
 qq/qPgre3ZtHVpsUn2Fz/hLTcu5fcs9xSJ6qGxbRbQW9PA/9Yoq3I03DfYsDkhAaXJtK
 nm+BsZLUyUZNp7ZEVZ1Gk6OUbW4CjOqA1NwAfyIs+zR65pSOIBedwWoC5Doe37ghkrpo
 0kbg==
X-Gm-Message-State: AOAM533xpzRhnUCBipPbmXo04avryn3pArn/4hoq0tHuOHwwA/jKgILc
 fJP7xGf81iTfMoLpp2pQTg==
X-Google-Smtp-Source: ABdhPJzWPE8O3q99Q9+RzPgzMZpx69D3yqiRk3ejyaURbwNHkg/tdWoZDmSKNx4IIjcnExLRTo/ooA==
X-Received: by 2002:a05:6602:1343:: with SMTP id
 i3mr10387390iov.134.1598390977445; 
 Tue, 25 Aug 2020 14:29:37 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id g6sm12518iop.24.2020.08.25.14.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 14:29:36 -0700 (PDT)
Received: (nullmailer pid 1366394 invoked by uid 1000);
 Tue, 25 Aug 2020 21:29:32 -0000
Date: Tue, 25 Aug 2020 15:29:32 -0600
From: Rob Herring <robh@kernel.org>
To: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: MIPI I3C Host Controller
 Interface
Message-ID: <20200825212932.GA1360264@bogus>
References: <20200819031723.1398378-1-nico@fluxnic.net>
 <20200819031723.1398378-2-nico@fluxnic.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819031723.1398378-2-nico@fluxnic.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_172940_566894_9C0F919E 
X-CRM114-Status: GOOD (  19.07  )
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
 Matthew Schnoor <matthew.schnoor@intel.com>, linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, Aug 18, 2020 at 11:17:22PM -0400, Nicolas Pitre wrote:
> From: Nicolas Pitre <npitre@baylibre.com>
> 
> The MIPI I3C HCI (Host Controller Interface) specification defines
> a common software driver interface to support compliant MIPI I3C
> host controller hardware implementations from multiple vendors.
> 
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> ---
>  .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> new file mode 100644
> index 0000000000..8fc18ea922
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/i3c/mipi-i3c-hci.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MIPI I3C HCI Device Tree Bindings
> +
> +maintainers:
> +  - Nicolas Pitre <npitre@baylibre.com>
> +
> +description: |
> +  MIPI I3C Host Controller Interface
> +
> +  The MIPI I3C HCI (Host Controller Interface) specification defines
> +  a common software driver interface to support compliant MIPI I3C
> +  host controller hardware implementations from multiple vendors.
> +
> +  For details, please see:
> +  https://www.mipi.org/specifications/i3c-hci
> +
> +properties:
> +  compatible:
> +    const: mipi-i3c-hci

What about my comments on v1? Pasted again:

A register interface (or protocol) spec is never complete enough to
capture all the details about a specific h/w implementation. One just
has to go look at AHCI, EHCI, OHCI, XHCI, UFS, 8250, etc. bindings.
Let's not start with pretending that here. Fine for this to be a
fallback, but it must have a compatible for a specific implementation.

Also, which version of the spec does this compatible correspond to? Or
are there not HCI differences in the spec versions you mention in the
cover letter?

> +  reg:
> +    maxItems: 1
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +examples:
> +  - |
> +    mipi_i3c_hci@a0000000 {

i3c@a0000000

> +      compatible = "mipi-i3c-hci";
> +      reg = <0xa0000000 0x2000>;
> +      interrupts = <89>;
> +    };
> -- 
> 2.26.2
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
