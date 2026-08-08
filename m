Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B29C55174
	for <linux-i3c@archiver.kernel.org>; Sat,  8 Aug 2026 13:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4lkiaCrZIlVLlX/HutO2zdmsVlOCqL0VRltbmfRbsIg=; b=L7xjXalNjyROlo
	8J26FS2Pj6oroFzUE3L8JZ0ZW4WyjVgUXOcR0IqN0PXogTDx6jsxv8H+b4j6XPCTtDAuz2AuTzsLE
	uC65IfxgTNcrLAPgVifFG2nDDtCll+mLN1Ze7VLX43vSTxCTmS0vDAdw7rwDvopIcHqXh0NwgLKpn
	O/s5q67AXFvxVYAqkkzw2qLVVieCJI9tpL9Qsf05368kHYyAx4/VsgCPGh1n8zX5LQq4V7bbZYhkr
	0yPmwEYRzoxTLfErg2h8ZK5NKTsxOingAPyAghe73jbAz2OE1KA3kLCV4rdoEu41lLpl2TvelZ4c0
	kWj2hGLrMTFVBS+ICrRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsgrM-00000009NcO-3M6O;
	Sat, 08 Aug 2026 13:13:08 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsgrK-00000009Nc2-0CSu
	for linux-i3c@lists.infradead.org;
	Sat, 08 Aug 2026 13:13:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E5DFE1A14D2;
	Sat,  8 Aug 2026 13:13:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B237E6045E;
	Sat,  8 Aug 2026 13:13:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 736D911C484B3;
	Sat,  8 Aug 2026 15:12:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786194779; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=bfZAzk0HnJSBMWq+kezzbVkR28SVWwNouuhGImysDro=;
	b=awwd2arIp9NVMhEcIaC0Fqugq1bq/CPpTeuRiPhdsKTHIoXycx+gmgIt0dE1mibhNjfFXM
	OBM+6GekqTE6swwDXHOkl21P+w+vRse/2084OdEd0c5velW/+ymBUG6HT7jVeVhnReg4qf
	Y0mLSNJMUNyP1ade9cIQTLyAn4GxiNhtXGIDoXrhIraqjWroYuSPe1IZmkGsP1jwW+wCLO
	JucTilJGA7/1HrAMPIDy+dBjUggGBBQcRE7e/vX9UUtjXMdknEFDQ+uNBdhTjEPGjUvXz7
	H3EMaAJjxoSGGjwtAgof6Kof5DjOUzCNSWJgloCnEp1MFlvHQz0HxOPtrfDjBg==
Date: Sat, 8 Aug 2026 15:12:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: tomm.merciai@gmail.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, claudiu.beznea.uj@bp.renesas.com,
	biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: renesas: Don't register devices when ENTDAA times
 out
Message-ID: <178619476971.3722554.9292570008305281170.b4-ty@b4>
References: <20260731070150.2519825-1-tommaso.merciai.xr@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260731070150.2519825-1-tommaso.merciai.xr@bp.renesas.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_061306_248623_72A071D1 
X-CRM114-Status: UNSURE (   8.78  )
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

On Fri, 31 Jul 2026 09:01:46 +0200, Tommaso Merciai wrote:
> renesas_i3c_daa() derives the number of newly assigned dynamic addresses
> from cmd->rx_count, which the response ISR sets to the number of address
> slots ENTDAA left unassigned. It starts out as zero, which already means
> "every address was assigned", so a timed out transfer leaves that value
> in place and it gets used as a result.
> 
> On a bus with no target connected the ENTDAA times out and the driver
> registers RENESAS_I3C_MAX_DEVS devices that are not there, each costing
> the core two seconds on a GETPID that can only time out:
> 
> [...]

Applied, thanks!

[1/1] i3c: renesas: Don't register devices when ENTDAA times out
      https://git.kernel.org/i3c/c/b6e56fd8c8a8

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
