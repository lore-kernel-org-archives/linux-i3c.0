Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BAEC07545
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Oct 2023 15:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c4bmXAxFJDgwP1Ak/578F1x4EEbgf8+p/201p2dTkFA=; b=PhiDfSwtasKQht
	wyVwbSSJJetK8aoNK1tD6/+lMcfw3kQVt1+bxWPFhitAJXQFuL5UreQ8Zb+bzPwPS7saC8PETg5ZP
	EuL7xk1BhqGyFr/CeEu4rpW27PBElxWbIWOw6DJHu0iB3FBzEydayGfW1Cdyycn5etD4djQH5P3eI
	+wmG/Sxyh+pSWNFsuA0r0UM5DxhCxU+LqIkh322c0phwlIr1qqErSsEwjskqDcSPMjJrlDykNMSg6
	hHDYxAH4Tr/OHv2CtghrgaV+AeKnrwmbdDigCjC4nD2fK2tYv57ntsmiyrGTfiij6qm+ALElRzooz
	cIdqrWa/bSIdFPqI/UeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvIyp-00ACWk-0z;
	Tue, 24 Oct 2023 15:06:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvIyl-00ACWI-2k
	for linux-i3c@lists.infradead.org;
	Tue, 24 Oct 2023 15:06:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3866F6145E;
	Tue, 24 Oct 2023 15:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D05EFC433C8;
	Tue, 24 Oct 2023 15:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698159950;
	bh=F93LEIRwPkxkpX2KL1Aw1knTdXl/0lgfHPPX7S8mhD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dPzCN4kZNZYS/Q/tRDSaHBrvar62KBf4MMY+yYOVK60ZkucgZse8twWqCec42Ck+d
	 Gvo7ebBRTAb5vW3eeeIaFl8lvUGNt9za+gToWm/ZYzGQTZGkK0Zb5AN/DqzvVDh+Iq
	 bEZrfFY8yvLvvXUBWprjBCKEJyeKPdoJfPKJoL5g=
Date: Tue, 24 Oct 2023 17:05:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Frank Li <Frank.li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
	imx@lists.linux.dev, jirislaby@kernel.org, joe@perches.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, miquel.raynal@bootlin.com
Subject: Re: [PATCH v2 1/1] tty: i3c: add TTY over I3C master support
Message-ID: <2023102442-immorally-repost-e736@gregkh>
References: <20231020160027.3663772-1-Frank.Li@nxp.com>
 <2023102105-outfit-legroom-1633@gregkh>
 <ZTaewidgtcDaBega@lizhi-Precision-Tower-5810>
 <2023102457-galore-uphill-4c84@gregkh>
 <ZTfVV3DW8jqH6ek9@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZTfVV3DW8jqH6ek9@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_080559_931028_2A354A36 
X-CRM114-Status: GOOD (  23.16  )
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

On Tue, Oct 24, 2023 at 10:31:51AM -0400, Frank Li wrote:
> On Tue, Oct 24, 2023 at 11:30:33AM +0200, Greg KH wrote:
> > On Mon, Oct 23, 2023 at 12:26:42PM -0400, Frank Li wrote:
> > > On Sat, Oct 21, 2023 at 07:02:40PM +0200, Greg KH wrote:
> > > > Note, your subject line needs to change.
> > > > 
> > > > On Fri, Oct 20, 2023 at 12:00:27PM -0400, Frank Li wrote:
> > > > > In typical embedded Linux systems, UART consoles require at least two pins,
> > > > > TX and RX. In scenarios where I2C/I3C devices like sensors or PMICs are
> > > > > present, we can save these two pins by using this driver. Pins is crucial
> > > > 
> > > > "Pins are crucial"
> > > > 
> > > > > resources, especially in small chip packages.
> > > > > 
> > > > > This introduces support for using the I3C bus to transfer console tty data,
> > > > > effectively replacing the need for dedicated UART pins. This not only
> > > > > conserves valuable pin resources but also facilitates testing of I3C's
> > > > > advanced features, including early termination, in-band interrupt (IBI)
> > > > > support, and the creation of more complex data patterns. Additionally,
> > > > > it aids in identifying and addressing issues within the I3C controller
> > > > > driver.
> > > > 
> > > > But where is the serial data ending up at?  Not a normal uart, what is
> > > > on the other end?  And do line settings mean anything here?
> > > 
> > > Currently, it use slave i3c code. 
> > > https://lore.kernel.org/imx/20231018215809.3477437-1-Frank.Li@nxp.com/T/#t
> > > 
> > > idealy build an i3c->usb dongle to bride it to usb acm. 
> > 
> > So no one has built such a thing yet to determine if any of this works?
> 
> It is easy to proof concept by I3C slave code and USB gadget ACM, then pipe
> two tty (ttyACM0 and ttySI3C0 together).

So you have not actually tested this?  why write a driver that no one is
using?

> Of we also can implement a USB to I3C class standard, base on this, reuse
> this tty driver at host side.

Is there a USB I3C standard?  I see i3c descriptors assigned by the
USB-IF, but haven't dug to see if there's more than that anywhere...

thanks,

greg k-h

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
