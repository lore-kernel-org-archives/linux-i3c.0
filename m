Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CF5C88E53
	for <linux-i3c@archiver.kernel.org>; Tue, 15 Sep 2026 11:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AXB6k2EH/azwmweHIpEGfstghCUT9XVBbFmEfQo/JfI=; b=kfDR2Hre0hdwi0
	Nr7iWpDltnA3H5wSgdVCWdJxhiVNZpOvqSkYYrv0uHvSrWWWdHnFTFDKMJjF9LRYVgCD7NcLaJbbZ
	I6Raa7dAcL26vyammXOheyr6IJsPv6uoEEZqIxa/SRGO7uWrxid/HjVgrk4ALXwnF1d4EIyv0Cp+I
	CPPhZQZNK5yNMIFnldSh80rgOYkkRPOheA6hACmwEe6kSDAl8vuPjfzElNg6P04RIgBU3VVrigu4Y
	Sy0nkaAFPV3xWOj4oZAzzD8jTfofAZLS8vIAxf/3vUMLXtjbsCFZSjtpgctgJU+C/F5cewZHt9eHI
	80a1OP6aYKYTJnqExd+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6R73-000000063to-062e;
	Tue, 15 Sep 2026 11:14:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6R72-000000063th-255a
	for linux-i3c@lists.infradead.org;
	Tue, 15 Sep 2026 11:14:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A3BAA602A8;
	Tue, 15 Sep 2026 11:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530F31F00899;
	Tue, 15 Sep 2026 11:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789470847;
	bh=HLagQFQZOyEmaZUWnZfwJED805o1ysF8ciaZJE3W+Qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NPIpuyQrSy7s3haa/uTKou3xO0PdgTpAZXLXx2QJ6mrAyTNjNPCkJZbC/fbYK7ViK
	 NHlWGIeEFc+e2v2hPm9IdLId37dKNqX18mNA/aRwOMrepWDtCnMr+yoRsWxD0qdQum
	 PAKa0oHowZvQjNseJ7oexQ7vCIuGFe5Q3kNjL3KqsZmJM2JAnq8Y6xXDAP8fFExVXD
	 1VIqtkv/mVJNTpdeZxPxrwCTroIOc8TBenqTjeGkNtnDWl2ATNJlgD4MzxJnSc12E7
	 TEfgCppNOCabcaDhOgc5/1T5RFmGrT5ytPDR4IiJK0bYv38Qbs6MxegTOW6+ewsYep
	 nuRgswHziZL6Q==
Date: Tue, 15 Sep 2026 12:14:01 +0100
From: Lee Jones <lee@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>,
	Frank Li <frank.li@nxp.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	Vikash Bansal <vikash.bansal@nxp.com>,
	Priyanka Jain <priyanka.jain@nxp.com>,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: Re: [PATCH v18 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
 and on-die regulator
Message-ID: <20260915111401.GD11487@google.com>
References: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
 <20260903062108.2712296-5-lakshay.piplani@nxp.com>
 <AS4PR04MB93625052401AF41C2ACC2D66FBBE2@AS4PR04MB9362.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AS4PR04MB93625052401AF41C2ACC2D66FBBE2@AS4PR04MB9362.eurprd04.prod.outlook.com>
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

On Fri, 11 Sep 2026, Lakshay Piplani wrote:

> 
> NXP Public
> > -----Original Message-----
> > From: Lakshay Piplani <lakshay.piplani@nxp.com>
> > Sent: Thursday, September 3, 2026 11:51 AM
> > To: linux-kernel@vger.kernel.org; linux-i3c@lists.infradead.org;
> > alexandre.belloni@bootlin.com; krzk+dt@kernel.org; robh@kernel.org;
> > conor+dt@kernel.org; devicetree@vger.kernel.org; broonie@kernel.org;
> > lee@kernel.org; Frank Li <frank.li@nxp.com>; lgirdwood@gmail.com
> > Cc: Vikash Bansal <vikash.bansal@nxp.com>; Priyanka Jain
> > <priyanka.jain@nxp.com>; Aman Kumar Pandey
> > <aman.kumarpandey@nxp.com>; Lakshay Piplani <lakshay.piplani@nxp.com>
> > Subject: [PATCH v18 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
> > and on-die regulator
> >
> > From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> >
> > Add core MFD support for the NXP P3H2x4x
> > (P3H2440/P3H2441/P3H2840/P3H2841) family of multiport I3C hub devices.
> > These devices connect to a host via I3C/I2C/SMBus and expose multiple
> > downstream target ports.
> >
> > All variants share the same register interface. The driver reads the target-port
> > count from DEV_CAPAB and applies the DT configuration, so no per-compatible
> > driver data is required.
> >
> > Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> > Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> > Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> Hi Lee,
> 
> A gentle follow-up on this MFD patch. Could you please review it when you have a chance?

Don't do that!

It was on the list, but since I handle all of my reviews in
reverse-chronological order, you just put yourself at the back of it.

-- 
Lee Jones

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
