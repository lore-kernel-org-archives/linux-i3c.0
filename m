Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CECC4828D
	for <linux-i3c@archiver.kernel.org>; Sat, 27 Jan 2024 19:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZuQSeQV/GMIik8VPNmCGV7MNkzCF3IDvEqwI7UD0VM=; b=iTQSSEILTaanoq
	nOdzX7fr5rej2t20VumOZsPfOXQ4ANCbYLYD/cMqj7WZG/tnXK7RwpgvmlRej7mkVEjdDOaN8yrbV
	d5gxfff2ZAeuLStq7B1aXtbr30n7H7iW6tFi0bjeKm6kA2rI6nljUj+pXBRsj5ykwROrlIVRsGkFu
	VjPbRNbIc6smjH+znbICkl8919odjJFnvLRySlq5IbN1tju4fjasb39f+ayJPB8wDhLDCJWHG0iE3
	MU0+bmUny6eWNJ1kPSQSWb/tFW+xtKX7/2InAZ0q1UXNcHWIbRTIYbnqhI6kgu8TsC4YYLWKfFRxI
	XHL2Y1qmFWt42eTmHwoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTojc-000000087uv-3O7i;
	Sat, 27 Jan 2024 19:53:00 +0000
Received: from mgamail.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSejF-003pFP-23
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jan 2024 14:59:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706108389; x=1737644389;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=RzDbhYSEcmLvl0Tieidy5sjp9uAbbBuDzPRK5lNr8Tk=;
  b=Rad8RzOMNRSMbpEb0h/LyNozx6c/yPxpLHPg36fHT+nYGqtN4QxJNOyB
   12S1d5+HZovxhptnFR68l2ZQK/eyqumwet6V+UqqI6Binob/NSB9lXfrX
   vxPlgWmUGBA5NuTKCWWTNeuCICi1QjxYxW4QGWFjOF6/dv+JubTB6oJGq
   PQRuuITgdPDtsjryYD0Su1I9nkU9UIWp6fN9ZUmCIL+HqkrjA1JalGsdt
   ZB2yYqEVy/LRLy6g08s7let9msg+wbj7NqXXW8YzM8wWJK8w2TOwPBJsT
   Zap4EyojtwR/5+i4wI60o5up9hhq8zEl1hWEvoggKL3FlMmSeO2MCxKv+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="405616923"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="405616923"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 06:59:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1932880"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.48.46])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 06:59:40 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 24 Jan 2024 16:59:36 +0200 (EET)
To: Frank Li <Frank.Li@nxp.com>
cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com, 
    devicetree@vger.kernel.org, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, imx@lists.linux.dev, 
    Jiri Slaby <jirislaby@kernel.org>, joe@perches.com, 
    krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org, 
    linux-i3c@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, miquel.raynal@bootlin.com, 
    robh@kernel.org, zbigniew.lukwinski@linux.intel.com
Subject: Re: [PATCH v4 4/8] i3c: svc: Add svc-i3c-main.c and svc-i3c.h
In-Reply-To: <20240123231043.3891847-5-Frank.Li@nxp.com>
Message-ID: <bb434214-0607-4054-dd04-a870db9e7f5d@linux.intel.com>
References: <20240123231043.3891847-1-Frank.Li@nxp.com> <20240123231043.3891847-5-Frank.Li@nxp.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_065949_737906_822A5546 
X-CRM114-Status: GOOD (  12.77  )
X-Mailman-Approved-At: Sat, 27 Jan 2024 11:52:56 -0800
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

On Tue, 23 Jan 2024, Frank Li wrote:

> SVC i3c is a dual role controller. Move probe() into svc-i3c-main.c. This
> prepares to support target probe depending on dts "mode" settings.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/i3c/master/Makefile         |  3 +-
>  drivers/i3c/master/svc-i3c-main.c   | 52 +++++++++++++++++++++++++++++
>  drivers/i3c/master/svc-i3c-master.c | 34 ++++---------------
>  drivers/i3c/master/svc-i3c.h        | 11 ++++++
>  4 files changed, 71 insertions(+), 29 deletions(-)
>  create mode 100644 drivers/i3c/master/svc-i3c-main.c
>  create mode 100644 drivers/i3c/master/svc-i3c.h
> 
> diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
> index 3e97960160bc8..484cb81f45821 100644
> --- a/drivers/i3c/master/Makefile
> +++ b/drivers/i3c/master/Makefile
> @@ -2,5 +2,6 @@
>  obj-$(CONFIG_CDNS_I3C_MASTER)		+= i3c-master-cdns.o
>  obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
>  obj-$(CONFIG_AST2600_I3C_MASTER)	+= ast2600-i3c-master.o
> -obj-$(CONFIG_SVC_I3C_MASTER)		+= svc-i3c-master.o
> +svc-i3c-objs				+= svc-i3c-main.o svc-i3c-master.o
> +obj-$(CONFIG_SVC_I3C_MASTER)		+= svc-i3c.o
>  obj-$(CONFIG_MIPI_I3C_HCI)		+= mipi-i3c-hci/
> diff --git a/drivers/i3c/master/svc-i3c-main.c b/drivers/i3c/master/svc-i3c-main.c
> new file mode 100644
> index 0000000000000..053b2bd9d8317
> --- /dev/null
> +++ b/drivers/i3c/master/svc-i3c-main.c

...

> +module_platform_driver(svc_i3c_master);
> \ No newline at end of file

> diff --git a/drivers/i3c/master/svc-i3c.h b/drivers/i3c/master/svc-i3c.h
> new file mode 100644
> index 0000000000000..0bd1f0112a071
> --- /dev/null
> +++ b/drivers/i3c/master/svc-i3c.h

...

> +#endif
> \ No newline at end of file

Add the trailing newline characters.


-- 
 i.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
