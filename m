Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977D8E6748C
	for <linux-i3c@archiver.kernel.org>; Thu, 31 Oct 2024 22:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPClpHRh41MW8pM9ql/H4lTwXlqKTF7JuuPZFJN0nLc=; b=kxGLLoN7oU84ih
	vu3kz77WBBp6tuO5kar7E7FwEV+lSi6tVjaKpWIN7JstcP3noZ6wY25xr+/Zdb72smnYlRbWfOo6K
	Y/Tmvspf63XZxsCZWZPSfzZMJeoZwDPRMH4AH/8wbqzbkKPzhFRBnFGjHE6TSZHTfwcGatscjVWhv
	An5+h6pc/9CSOEoANUk5sfUm6QowlZNQMSLw94lblRK85sWkqhlRt3GQVJrhs/fS5Wfer1ry0tm+7
	JMOn7qXDztirYqxID0YXSrv2XOS5hPHrUdBUcfe/CD3bXN+Kcsf15ybHdCuVdRRGbF1btm4Yfdwop
	owKLLzlXwjx0ONZKwYQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6e50-000000056ic-1dan;
	Thu, 31 Oct 2024 22:55:50 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6e4w-000000056hk-3BUv
	for linux-i3c@lists.infradead.org;
	Thu, 31 Oct 2024 22:55:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABBD4C0005;
	Thu, 31 Oct 2024 22:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730415342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JQA0d1WJrJIdFs7Zvw7Azp27bcFdE29fGgC676nj/eQ=;
	b=czHwhS0aKKP6ir28M751dMssoU/Trd2ZUOKZ5ONNx/mXiun4QOxVtlUQ+NWMAkkh4s2Kgm
	914fRoNAfZ4RrIwBv1J+DL3Rft7St5AKkHCoqCR/287bqeHE06UoCx3AwdPitPabzPSFO3
	b5PQNVtIJ7/6eFqYmhd8PhrcDuF0eMvmFiAueAM3bTvvyVd18w29+FHFJgFztw45D2jWeG
	gwT9Zm5mr9y83+DtkKN3c8vv/GKYGeKAtOJXQ2+UiZDZFQbynV4vBmLE/yUPbx5els16L8
	oRr2rxOB278G2Q5JUBtJRip43tZ0bhBmKOMFZmg2w2+uj3kPSMWkVQVdbaABhw==
Date: Thu, 31 Oct 2024 23:55:41 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, stable@kernel.org
Subject: Re: [PATCH v6 0/6] I3C: master: svc: collect all patches to improve
 hotjoin stability
Message-ID: <173041531797.2391928.6742670173313972551.b4-ty@bootlin.com>
References: <20241002-svc-i3c-hj-v6-0-7e6e1d3569ae@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241002-svc-i3c-hj-v6-0-7e6e1d3569ae@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_155547_103008_78B289FE 
X-CRM114-Status: UNSURE (   8.19  )
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

On Wed, 02 Oct 2024 10:50:32 -0400, Frank Li wrote:
> This patches is splited from
> https://lore.kernel.org/linux-i3c/ZvrAuOBLgi+HtrPD@lizhi-Precision-Tower-5810/T/#t
> 
> It needs more discussion about dt assign address issue about i3c framework.
> 
> This series is svc driver improvement and bug fixes for hotjoin. It fixes
> all kinds hotjoin problem when 2 devices random hotjoin and A normal data
> transfer is on going.
> 
> [...]

Applied, thanks!

[1/6] i3c: master: svc: use repeat start when IBI WIN happens
      https://git.kernel.org/abelloni/c/3c6684a15010
[2/6] i3c: master: svc: manually emit NACK/ACK for hotjoin
      https://git.kernel.org/abelloni/c/e22405a812a1
[3/6] i3c: master: svc: need check IBIWON for dynamic address assignment
      https://git.kernel.org/abelloni/c/6a12f56f7392
[4/6] i3c: master: svc: use spin_lock_irqsave at svc_i3c_master_ibi_work()
      https://git.kernel.org/abelloni/c/f36f6624cbac
[5/6] i3c: master: svc: wait for Manual ACK/NACK Done before next step
      https://git.kernel.org/abelloni/c/3ca529194e29
[6/6] i3c: master: svc: fix possible assignment of the same address to two devices
      https://git.kernel.org/abelloni/c/3b2ac810d86e

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
