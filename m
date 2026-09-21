Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26046C982ED
	for <linux-i3c@archiver.kernel.org>; Mon, 21 Sep 2026 23:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RWRCThHx+JUMmQc/TddRJ47Ugum0gcfOmWDRyghHx8I=; b=g6KPaUV0Z02RPg
	8Mord/7wCdFDrubWNShoWjYnB+ieK/r60mEPEPxi12TjeQcuY7CDfudneyKmUOQkCId9cjCPM9BdD
	C7t+4ECsi51bhgzeIh3cW8buhYNhhiHAllO/HRYrSleudN6zQM3AAUTA9CfEU7b0sDoXwaRlx6lYe
	szUMF5hB5Ir06ONDuFHvic0kif6AIGwiyFFjiRwd52bq9Ex+OTt8q8KqD0i5F1WUrH8iRisDS98pV
	kOMpN7xc3Zdya3SSutmArV7XDRHHFFyXeQmho4O2AXDaaEnAnc/eHf7slc1OBAs482XmRgQl48sjn
	SAG20nEgUQD0fYx3ltRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8n4W-00000003dML-2m39;
	Mon, 21 Sep 2026 23:05:16 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8n4S-00000003dLl-3yS6
	for linux-i3c@lists.infradead.org;
	Mon, 21 Sep 2026 23:05:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ECD4F1A0FA6;
	Mon, 21 Sep 2026 23:05:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 970FF5FFB2;
	Mon, 21 Sep 2026 23:05:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69CAF10328621;
	Tue, 22 Sep 2026 01:04:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790031903; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=PtwHNzjPC9syVsM38bsjniJ7znP2GlKXTVxfU/r5K48=;
	b=Ng9xWTGlwsysgxUVsq8QyuT6+Knmct6Y0Xk1YlRlS4ZezAfv7D5ssvBNr4vEEk+kELOF8G
	OWqXaXnMTmY8gPuRTQeTgbofXH01wxDj8LNCO+kuoRMR6cYDIj6Y5ygWSHXEMcLQ/Imlmt
	MLI28NdkbMmwg5kpROzWEE9QaY50ULjU2EYOCs4A2t9uejpOMGVskWgi8IuwV3Pjj08rbX
	f0tdmypvRBgFQ54f7o83jJ4OKxtrnUe5dgCXhUNWTah2ORWUMWHTUhAY7KTTzwtL9tFlzS
	Bf3hnPvLBmc/OeEAHzhqf3FqUySxnuCuBs6JIbFVv+v+bnuGGwAl+xDt5uaFYA==
Date: Tue, 22 Sep 2026 01:04:57 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, adrian.hunter@intel.com, git@amd.com
Subject: Re: [PATCH v2] i3c: master: amd: Report direct CCC read length in
 payload.actual_len
Message-ID: <179003189124.296788.5581346293619108120.b4-ty@b4>
References: <20260908111207.3274407-1-shubhamsanjay.patil@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260908111207.3274407-1-shubhamsanjay.patil@amd.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_160513_134799_21C330E9 
X-CRM114-Status: UNSURE (   6.48  )
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

On Tue, 08 Sep 2026 16:42:07 +0530, Shubham Patil wrote:
> The I3C core expects master drivers to leave payload.len unchanged and
> report the number of bytes received on GET CCCs via payload.actual_len.
> The AMD driver was overwriting payload.len after direct read CCCs.
> 
> Set payload.actual_len from the directed command's rx_actual in
> xi3c_master_send_direct_ccc_cmd() instead of modifying payload.len.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: amd: Report direct CCC read length in payload.actual_len
      https://git.kernel.org/i3c/c/bf9ec06c90dc

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
