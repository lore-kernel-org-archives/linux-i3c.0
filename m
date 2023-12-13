Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63144C4332F
	for <linux-i3c@archiver.kernel.org>; Wed, 13 Dec 2023 08:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tVXDZKKfzYRsSQbMHyx0oG9td8o0Hjqb4YIxhx91OhU=; b=d0+DKEv3M7Xvao
	hmgVRUzcWpgN/ewR1OCirSVfL4JYVEu7WoyOU206svW4h8WwkMtMnGUQKG6Q4+m4p5LqTpLVZ9pfD
	OSb5m6nt7shrV7IG+5PAIWgcLmQEoSnWaVdTNMsefU4kiSCZ7FbRPHkrO5pypFmx2iKiDGVMJM/UO
	Jm4Ax8BFfCFxxSzOH5Wo+IaHE6ieNpykahl40D7oAoDyz/rF5aQ6mefsKtO9alioA1MbiJ6id7Btw
	6c4uRq+ULPsfU0p9Q/uErx+xArgaA4ioTxtl9sQWWSgZwwrn5/tFZ4/Lq9G/EYaf2Xt3D8+IakoDn
	n6+ueinF42b9tYxTVRcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDKMG-00DzmW-1x;
	Wed, 13 Dec 2023 08:12:44 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDKM7-00DzlP-2p;
	Wed, 13 Dec 2023 08:12:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 844E4CE0BB1;
	Wed, 13 Dec 2023 08:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E430C433C7;
	Wed, 13 Dec 2023 08:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702455150;
	bh=6cLOPwMjvibdut8r74sh4DxCF/rsyHgNZEROG+kEFS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QJdSEwliaWDOQ8h2zpaMPCQFomNMzh/55V7/+H/gp/dXljDPmlxrGtx6XFFm1tQE/
	 8gmLtvdsVItk/iYq7mWa9d2KFH9OBN571ISMYXNHcczop0WG8zwYPAqYoJgvBboISu
	 BzcTBdad+gI+5/jhTQaz+w6MIlSyvQhvB0ogrkAnSAjr0FHtJQqw+cXWc/8T++FJfT
	 DGGCcTHZbhKBXykiJ0AZcaoB81ELuuCBErPaeL0KYEgZD0r1K2T9+TMwNYDVKG9fCV
	 b3gsDzzmj2JhUaPnwEW7VySWloSD1GzirhhRK1uCQf23Fz1h8RMjfu1NRnONhXUM0j
	 s072YauCltlFw==
Date: Wed, 13 Dec 2023 16:12:23 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: miquel.raynal@bootlin.com, alexander.stein@ew.tq-group.com,
	alexandre.belloni@bootlin.com, conor+dt@kernel.org,
	conor.culhane@silvaco.com, conor@kernel.org,
	devicetree@vger.kernel.org, festevam@gmail.com, haibo.chen@nxp.com,
	imx@lists.linux.dev, joe@perches.com, kernel@pengutronix.de,
	krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-i3c@lists.infradead.org,
	linux-imx@nxp.com, linux-kernel@vger.kernel.org, peng.fan@nxp.com,
	ping.bai@nxp.com, robh+dt@kernel.org, s.hauer@pengutronix.de,
	sherry.sun@nxp.com, xiaoning.wang@nxp.com
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: imx93: add i3c1 and i3c2
Message-ID: <20231213081223.GH270430@dragon>
References: <20231017194657.3199749-1-Frank.Li@nxp.com>
 <20231017194657.3199749-2-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231017194657.3199749-2-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_001239_283880_35E1E9E4 
X-CRM114-Status: UNSURE (   5.55  )
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

On Tue, Oct 17, 2023 at 03:46:57PM -0400, Frank Li wrote:
> Add I3C1 and I3C2.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
