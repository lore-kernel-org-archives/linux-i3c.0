Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737C6CA1007
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Sep 2025 00:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HTSLgmwmg1J5Jgy/MQjdJqgtbIkGDLGOrqyzzlHzf+E=; b=nSyg9xnXHm8ryC
	50cJMD/7R0/v3ogs+KKAWfRqtSXxiKTOGFecpTL34EoACIXdARf3aq4dPP8MC7CIiuHe2Bq60Eq8y
	RRiM05xRsy1OpaqwLb/1sLvStied16dTmfIuUT8cm9rpaatwoJZF2K4AMJFUIWeDaw7yoQpRjjMHV
	t/TYT0Lk7Y7falAh3hyWKlcpTb8DBXibAsakrgcMewtqihalaT0Qs+yL5HgxwBSCllxK0Rmf93I15
	T0Mu65cJ4s1BZmuvleDodqqjH/vRrBUvILAT+RbBZZsa+CvM4mLt8BXv5g36dAvrM6Whgs1Qpwlsa
	nlMWSylFYXsWfur/hX7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFG9-0000000EYIe-0qKQ;
	Tue, 02 Sep 2025 00:52:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utAtr-0000000DkYf-3yfg
	for linux-i3c@bombadil.infradead.org;
	Mon, 01 Sep 2025 20:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yx7mHEOoHsc87Dtv9nuxZTICDeAvK7jqOFwE7WdiL7s=; b=nGGIoinRmEHFEc47Q6i9jzGTqC
	K3F+5ra3rnvZwXrmehCwmtRCvJe6/bkD9AlRrFo5gTm1FlBzer9uPBbGzOIDg+FGn+BYkfSGZgSAR
	YcyanFL7JLMjIed3XReUSGZHZae1I2EEWImU2kVphzndAsFQkvPNCaHozcQwaMKM8HhkZEzUvn9Ja
	yFfGFLRw+iXe20yerBjn5oaEa09OUcLpGnNKk0Pw9y1i/ksWiUBZk6IL3RexryIV3uWy0q4j+EYQ4
	pYvD8K3oKwgbwWE7NRfkeIgswX+GRBP4GQJUcvLnU9/PprAAHyMnoJEjT3GSgSFEH5guncPjFM9Td
	ZbqxBQYw==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utAtn-00000003rYz-1Grg
	for linux-i3c@lists.infradead.org;
	Mon, 01 Sep 2025 20:13:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C8DEBC8EC40;
	Mon,  1 Sep 2025 20:12:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9A141605FC;
	Mon,  1 Sep 2025 20:12:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 453091C22D4DC;
	Mon,  1 Sep 2025 22:12:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756757576; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=yx7mHEOoHsc87Dtv9nuxZTICDeAvK7jqOFwE7WdiL7s=;
	b=WHzpMIZjyezAVqM5LP+PwrF5dQX10LbmN7LXHNVX4E0d1Pahp/10z5ZXuiGO8kwnDRCZJD
	/BQgMEk7hT09KLlTALWS02GhIsryTQ61olMvL+CSiKbmN+Ljr8RKEAP5UTSSVK+vdSObN1
	+zu16/Ur87JB5qOan4XoVM3+7Pdu1SK5Ve3xxgRp3BmZeVwoki+kI/h3d2VAl0wdCoZIDO
	NHE1IudywD+OynU8gbdUH7HUEsdBYElVX/eYdXYAr6RD48tfuLca64OgvC/4lRXidigdE0
	+Wmi2tFS0yYtGB62hKH+PJntWWby9pTr03E0Fx8KEVLh3lc37DnRR/6kK0+sHQ==
Date: Mon, 1 Sep 2025 22:12:48 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: git@amd.com, michal.simek@amd.com, Frank.Li@nxp.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, kees@kernel.org,
	gustavoars@kernel.org, jarkko.nikula@linux.intel.com,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	radhey.shyam.pandey@amd.com, srinivas.goud@amd.com,
	shubhrajyoti.datta@amd.com, manion05gk@gmail.com
Subject: Re: [PATCH V2 2/2] i3c: master: Add AMD I3C bus controller driver
Message-ID: <202509012012480348cc7a@mail.local>
References: <20250829171327.2590730-1-manikanta.guntupalli@amd.com>
 <20250829171327.2590730-3-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250829171327.2590730-3-manikanta.guntupalli@amd.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_211307_932960_A551836E 
X-CRM114-Status: UNSURE (   6.76  )
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

On 29/08/2025 22:43:27+0530, Manikanta Guntupalli wrote:
> +static void xi3c_master_reset_fifos(struct xi3c_master *master)
> +{
> +	u32 data;
> +
> +	/* Reset fifos */
> +	data = readl(master->membase + XI3C_RESET_OFFSET);
> +	data |= XI3C_FIFOS_RST_MASK;
> +	writel(data, master->membase + XI3C_RESET_OFFSET);
> +	udelay(10);

As pointed out by checkpatch:
usleep_range is preferred over udelay, I guess it would be fine in this
function.

> +	data &= ~XI3C_FIFOS_RST_MASK;
> +	writel(data, master->membase + XI3C_RESET_OFFSET);
> +	udelay(10);
> +}
> +

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
