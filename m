Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA36BCD6E60
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Jun 2026 15:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C/w46OpkNTqwsYaW9Dx57+1G9RH4V2ZKCZ/53UsRZOk=; b=CX6uTcWLKTtzMF
	oWYgmaORmP/0fB4dHMyUbhIB2ukMJMKmpwFiPwK93lmUNHguF8uGgNhxilRZ95HZDf+Wu/M3blEJo
	V5+zYt71H597SBbB+LdBOycWfc+JWV7Ot7ZO+dGr7e6439IoOluh55uxl2H8TQ9JeXmEKivel5eNU
	EjfyhEnurqJ2DHE3YmPy2kbocarvAu4dTOdcqHzdsgHNAVoc84WVXHDRLCoVl+UiGJrtnj7Ro29zC
	vxB+QJCy4WNAqC9IPrPDL6vlLje6tIb0XmFqxvdDlL+sERv2sWzjJI7WM2H/4PffVxyyOV6aQDPcy
	a/zbQ+Z5vrdZ9tPXzsqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUQkM-0000000DFzv-1EFh;
	Tue, 02 Jun 2026 15:09:38 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUQkI-0000000DFyq-07Va
	for linux-i3c@lists.infradead.org;
	Tue, 02 Jun 2026 15:09:36 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUQkA-0002Tk-Bk; Tue, 02 Jun 2026 17:09:26 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUQk9-000lm6-2D;
	Tue, 02 Jun 2026 17:09:25 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wUQk9-00000000E3f-2VrF;
	Tue, 02 Jun 2026 17:09:25 +0200
Message-ID: <940a05a3e4188b4206efad8ce1b2ef46e459a7d8.camel@pengutronix.de>
Subject: Re: [PATCH v2 09/17] i3c: renesas: Use reset_control_bulk_{assert,
 deassert}()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Claudiu Beznea <claudiu.beznea@kernel.org>, 
	wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com, 
	alexandre.belloni@bootlin.com, Frank.Li@nxp.com
Cc: claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>
Date: Tue, 02 Jun 2026 17:09:25 +0200
In-Reply-To: <20260602132824.3541151-10-claudiu.beznea@kernel.org>
References: <20260602132824.3541151-1-claudiu.beznea@kernel.org>
	 <20260602132824.3541151-10-claudiu.beznea@kernel.org>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i3c@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_080934_063675_7697CEEE 
X-CRM114-Status: UNSURE (   5.10  )
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

On Di, 2026-06-02 at 16:28 +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Use reset_control_bulk_assert() and reset_control_bulk_deassert() in the
> suspend and resume paths to simplify the code.

This looks like we are missing
devm_reset_control_bulk_get_optional_exclusive_deasserted().

regards
Philipp

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
