Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40269CD5BAA
	for <linux-i3c@archiver.kernel.org>; Wed, 20 May 2026 07:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXbNx5o27i/9mtLsYCXekSyCU8LEiAX5yft+8CHQH1c=; b=NLiDkh9S/JBJXr
	gqClG7+tvBREC53AY9U19PUvjEEiScLZKyqLC52CFYvJLnO9TmGRCYb4ecuxJkVgXPw5adjBtdvJk
	kipKXo24YyRVwEPt4WepVh0pVbRJeFU5sSgpUyERnPplN6AF9dSAZObGZEnoYyq9ezgkLPILv0Vr2
	0LhghXbj/gcDm7miw2UJcT7//JwjONs4nYlfMr+NFjzkIsWSI0h3F7A3fgl80wGvqBbk/B4NlHOkO
	sXzw3+iwpice4ZrBGBbOrMXx8HufhcAjFzG+uiZQZGb25fWXrqKL3Y4Nrk8VUJM8PWnhk4HyLBpYU
	/PncY1YtKIeVpWNVQUVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPb81-00000003lL1-42S7;
	Wed, 20 May 2026 07:14:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPb7y-00000003lKg-1sIK
	for linux-i3c@lists.infradead.org;
	Wed, 20 May 2026 07:14:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id CE615601F3;
	Wed, 20 May 2026 07:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id EB9B31F00893;
	Wed, 20 May 2026 07:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779261241;
	bh=ynRPwo2RCDanVemDlYKybThG1Y1g4MsFCiwpqfVobF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eavSexl364HbOovm6py2OAe6GkarbNkB/3eF32hZjEJtlpaKwXTB5zVifTZozUuO/
	 eGZeL6M9OJXHl9rBU1tLt0lPXz7HAXA/8YC8zQLVlu/KFAZK7yPHE+2t5MlxLSkTtn
	 BJ15mumJw3fq1ILaqLvWQ08vol905ADRm9L7Q3bUNncKLYxTVWJQJQ8DGspUUHLpyw
	 YCifWMUx3Pg/Ux+AqeMihGZD/vg/5HwJAlSlTSlAsWzbEHc2yQbh7FTKIibuY3wSb7
	 BknfOxnD3ENjbdSuGgKlcgO0ImLIKUpRHpv/xdiu+r9o5tfE7hbhdym4kTrRSvqjLd
	 5wmOPgdyp/bKQ==
Date: Wed, 20 May 2026 09:13:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] i3c: dw: Remove core reset "_rst" suffix
Message-ID: <20260520-scrupulous-notorious-ibis-ab6cbc@quoll>
References: <20260519055105.13079-1-jszhang@kernel.org>
 <20260519055105.13079-2-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260519055105.13079-2-jszhang@kernel.org>
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

On Tue, May 19, 2026 at 01:51:02PM +0800, Jisheng Zhang wrote:
> It's redundant. This suffix has been in the code from day1, fortunately
> there's no such dt property usage in all dw i3c users after grepping all
> dts files, so we can remove it.

Hm, how could you grep all 3rd party / out of tree users of this?

> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 655693a2187e..c4a848cc978a 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1587,7 +1587,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>  		return PTR_ERR(master->pclk);
>  
>  	master->core_rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
> -										"core_rst");
> +										"core");

ABI impact for something released since 2018. Cleanup of name is not
really worth affecting users. core_rst is not the best name but it is
not incorrect, either.

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
