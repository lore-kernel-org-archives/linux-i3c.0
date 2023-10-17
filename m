Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE3BCDB474
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 22:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJO1YH2H+8QYR7rk00wjgTCP+alW3zi6GpW1PLw486g=; b=j4gHos1dhsT47W
	c5nwBLjvuknF3ThHKmV2nzuSGiRrpa22IHqChL7VJGciO905OYbQ0ylxb2/yjpMvEyVGUONlSA/dQ
	ablONO9qRlWWthAk6Qj1b9hpMrbt25p1dvBq65n7XHN8I+wd/v85WFIUqXu8+oVivf2nTQwKHblp0
	k6/oxUnARriD875bT+e9fnLoeeUL4gf1k7dkxi08+DDRwm8vktCHEunxBQHykwvTJfE+gaENE1Kyx
	gsh0WIre39Gi7/smNZuTSNVKYAqpb+Qp3YEY4QTRquYglOe5nr0gqJ/GOH+qt0M/eA/dMGx+bycld
	DBnPS/gEevXPdpdmOj/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qssSY-00DLor-2u;
	Tue, 17 Oct 2023 22:22:42 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qssSW-00DLns-0y
	for linux-i3c@lists.infradead.org;
	Tue, 17 Oct 2023 22:22:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C49E240005;
	Tue, 17 Oct 2023 22:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697581351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RYhFnz8eyfMROGBEry38EvxL6FIh7wOsJOmeYjg9T44=;
	b=C9NeFpwfRDPAgZ3ve02+rfgt6FDHnz6jvyoqPt/uan+r85WkXy9M/Slu1ze6a713seBJpJ
	0u+/J/Z+PgL6grtOaC2zP7wgr6JSH1n8ftacz1T1BniTVd4AntP0sgNXSgfPJ+Lj46hPfv
	eTQIRLu1t2N6JBJqeltIwBmIL4jxWlRAP+B82eAqyRSLCKmKPV7RIVWd3n7/Cvxyvxqelp
	0KY7v8P2IEEqidS2cHrMAtblgG200vSiQTQteMiR8JV+nTxdmqRXJrz9NwcmGkapqXnJt4
	MUwXlLJ0laJWaYaEfm3R2MeH6oCAjpnC7XYzWisuoF1BeTn+4hKnAOWXILpHHg==
Date: Wed, 18 Oct 2023 00:22:30 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, conor.culhane@silvaco.com,
	joe@perches.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/5] i3c: master: svc: enable hotjoin default
Message-ID: <20231017222230636965c5@mail.local>
References: <20231016154632.2851957-1-Frank.Li@nxp.com>
 <20231016154632.2851957-2-Frank.Li@nxp.com>
 <20231017160457.4f0c2490@xps-13>
 <ZS6fbVtbuBH32aRU@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZS6fbVtbuBH32aRU@lizhi-Precision-Tower-5810>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_152240_497586_D18CD5B0 
X-CRM114-Status: GOOD (  13.42  )
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

Hello,

On 17/10/2023 10:51:25-0400, Frank Li wrote:
> On Tue, Oct 17, 2023 at 04:04:57PM +0200, Miquel Raynal wrote:
> > Hi Frank,
> > 
> > Frank.Li@nxp.com wrote on Mon, 16 Oct 2023 11:46:28 -0400:
> > 
> > > Hotjoin require clock running and enable SLVSTART irq.
> > > Add module parameter 'hotjoin' to disable hotjoin and enable runtime_pm to
> > > save power.
> > 
> > I am really not a big fan of the use of modules parameters. Maybe it
> > makes sense here. Alex, a better idea?
> 
> Maybe we can create sys entry to enable/disable hotjoin. I think i3c
> should default support hotjoin, but it exist user case that needn't hj and
> want more aggressive power saving.
> 
> If create /sys/ entry, it need change driver/i3c/master.c.
> 

If this can be changed dynamically, I guess ideally, we should be able
to set it independently per controller so it could be disabled on a bus
but kept enabled on others.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
