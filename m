Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E2EC433EF
	for <linux-i3c@archiver.kernel.org>; Tue,  8 Mar 2022 15:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mv6j1O2Jeq9To/0bXoDrY0TmILTDHjSJEdv5mFlk4DI=; b=c+9sfpciCKJ9kd
	vCxjwn40iydGxhfIMCqVQTxvOx9FeZnKhnZbPv4njbVLaoIV4AAGNBxOUCv+iPtJ9UeANf/VnGKK/
	7P+KCUOs2GLvsWPdr651oVmh0JTU/b5MS4LrmzUjv+CZ33JfhjceT9d/nqsu8+88H2gdUSuteoSz5
	yHeq4Jvq08myOV80NrRKYXvjMbUnZXCl0o1Yk+dO7UBrQiZUdcTskcHLFOwim5Q3dThLktgTzeSg3
	wLSCgC8UmsJRJ3by0RlWH1CPgtQuo8IKN3eX7+eSzLuzfXgKNfwc1XbG1xufeHeJgE02UvhDXpeBy
	FNlyBo1e/CWaUrue3Ubg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRbV1-004uhl-Sa; Tue, 08 Mar 2022 15:11:43 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRbUy-004ugn-NP
 for linux-i3c@lists.infradead.org; Tue, 08 Mar 2022 15:11:42 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 867FF1BF219;
 Tue,  8 Mar 2022 15:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646752295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vzFjOhB/Mhd1d4OOow2fO7Mre9PqubR5s7KKvAWByYw=;
 b=jHfcgY8L1pE7VgYsNBHvzyi4IIMPDIish6b2aK4PLrz2fJ7jMFczyqcWCKfl5xKozLARTS
 UGMa8DbRQ0YBtGhpsyROTY5cRdcrIyuGPVtQvPWYfnIUkg51rMwFA1uZbdKNuiZ5F0OZ5x
 rmifis5b2n2Kn7phkj9PTO2QfEZ0+0TOHE3Zg4iyN6+5V1JdFXv+D35pqYMQMwddJyI14I
 46ypARf9s4WwfSEGvi4Zj8qlAJGmiF1q9unjT/CBoOvBOTua4T+nYjYmNNG2yKxS9C9i+x
 hxwkRJjtTlAG2w09bNQF3iRkz46Buflx1/yLAO4yU0Z+i5IZDSCsqecSfTB2xA==
Date: Tue, 8 Mar 2022 16:11:35 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jamie Iles <quic_jiles@quicinc.com>
Cc: linux-i3c@lists.infradead.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] i3c: fix uninitialized variable use in i2c setup
Message-ID: <YidyJ50+JfpyKB80@piout.net>
References: <20220308134226.1042367-1-quic_jiles@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220308134226.1042367-1-quic_jiles@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_071140_987415_A169F2CD 
X-CRM114-Status: GOOD (  11.40  )
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

On 08/03/2022 13:42:26+0000, Jamie Iles wrote:
> 97a82882d852 ("i3c: remove i2c board info from i2c_dev_desc") removed
> the boardinfo from i2c_dev_desc to decouple device enumeration from
> setup but did not correctly lookup the i2c_dev_desc to store the new
> device, instead dereferencing an uninitialized variable.
> 
> Lookup the device that has already been registered by address to store
> the i2c client device.
> 
> Fixes: 97a82882d852 ("i3c: remove i2c board info from i2c_dev_desc")
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Jamie Iles <quic_jiles@quicinc.com>
> ---
>  drivers/i3c/master.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
