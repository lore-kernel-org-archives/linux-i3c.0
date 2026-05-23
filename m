Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89ABECD5BB1
	for <linux-i3c@archiver.kernel.org>; Sat, 23 May 2026 10:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vi/SvlPKI/oKkj82eqsPQoLAkU+dC2Fx5akIFi8XFsQ=; b=xGrK4rcOtOh9eo
	0USqPSpAF3L3883665YyzRZmGYqe352sojVm+jbpPdjxfgRtQmmK7NEK/LbqaSNeUdLZzb4zFx+Ak
	swWsvmzGnF2h66uY+p/V3LTgrLYzbpsJA+GIsSeT5LtcNjrksABqszEaZ1awiNk+dLwi5WldJa6K5
	Ujk9d2xsVaG+QB+yWDGjhTMh5ZHr426q7tiwtWYDNCV3Yv/O8v80hwr72RdGv3uUL+zma4cOCKgHv
	Ti5Vdij0IoUTgEQRWjoSmkKLY5wnw8KwFoWQ+UWE1BXYm1BuR03U1XnrkN8YGo4RYfAsDgGeYI8En
	vg6OwnOBq1H+kNard/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQjYg-0000000D5dg-2M5i;
	Sat, 23 May 2026 10:26:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQjYe-0000000D5dK-1dwF
	for linux-i3c@lists.infradead.org;
	Sat, 23 May 2026 10:26:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8142060138;
	Sat, 23 May 2026 10:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A721F000E9;
	Sat, 23 May 2026 10:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779531975;
	bh=zg0BMpcJGdRhMwcv7oWgWGvnbS4a0TigRFF8ryZrM78=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gsI/6f3K2og6R14AdMJX9N1SU1rJ4bwKxPmx7FpAn0jAouIRoCEfh7gSLTdDC39LI
	 JepXtdRoV7lG47cwVOUPe8+EYq2+oaKmHannXLUGfaHKin1+tH+H7JCIRd4AiC6Id8
	 kgVN8OVnGQ/zgWsw3Gf6wa2+B8DPSldsjIkNyaZZ1PI7ap1ifsTlHjgZGMxz/vp6Qx
	 +5Mr5XwvD9SowPoBjwaSFjCGv54/hc7Sjzyw+PMIXS/oP7/A4ZP4UidRqYLOJzAyC+
	 4sY9181x7M4TNyGiR2nGPlWU6Z17S4tZCs567eEC5n6ITsaNQsS0eKAGXssuhrRZil
	 rQScWOZ3gpAcg==
Message-ID: <4a82fe83-338b-46c0-b783-836256a28858@kernel.org>
Date: Sat, 23 May 2026 13:26:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] i3c: renesas: Perform Dynamic Address Assignment on
 resume
To: Frank Li <Frank.li@nxp.com>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
 alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
 claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-8-claudiu.beznea@kernel.org>
 <ahCrpz-J8a5HQSmY@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <ahCrpz-J8a5HQSmY@lizhi-Precision-Tower-5810>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org



On 5/22/26 22:16, Frank Li wrote:
> On Fri, May 22, 2026 at 01:18:05PM +0300, Claudiu Beznea wrote:
>> From: Claudiu Beznea<claudiu.beznea.uj@bp.renesas.com>
>>
>> The Renesas RZ/G3S SoC supports a power saving mode where power to most
>> SoC components, including I3C, is turned off.
>>
>> On systems where the I3C devices also loses power during suspend (e.g. NXP
>> P3T1085UK-ARD connected to the PMOD1_6A connector of the RZ SMARC Carrier
>> 2 + Renesas RZ/G3S SMARC SOM), the devices becomes unreachable after
>> resume.
>>
>> Running DAA in the controller resume path restores communication. However,
>> DAA relies on interrupts for TX/RX, which are not available in the noirq
>> suspend/resume phase (unless they are wakeup interrupts). For this, the
>> suspend/resume callbacks were moved out of the noirq phase. Currently,
>> there is no identified use case on either the Renesas RZ/G3S or Renesas
>> RZ/G3E SoCs that requires the controller suspend/resume hooks to be part of
>> the noirq suspend/resume phase.
> Can you referhttps://lore.kernel.org/linux-i3c/20260512121732.406009-1- 
> adrian.hunter@intel.com/T/#mafdc9631a2a18dfebfa5b5efcb8584d32bceba7f
> 
> which defer DAA to workqueue.
> 

I've reviewed this series and tested it. Tests passed on my side.

According to the following diff from patch 6/8 [1]:

  /**
   * i3c_master_do_daa_ext() - Dynamic Address Assignment (extended version)
   * @master: controller
@@ -1878,9 +1889,7 @@ int i3c_master_do_daa_ext(struct i3c_master_controller 
*master, bool rstdaa)
  	if (ret)
  		goto out;

-	i3c_bus_normaluse_lock(&master->bus);
-	i3c_master_register_new_i3c_devs(master);
-	i3c_bus_normaluse_unlock(&master->bus);
+	queue_work(master->wq, &master->reg_work);
  out:
  	i3c_master_rpm_put(master);

only the registration of the new devices is deferred. The RSTDAA command is 
still sent according to the following code in i3c_master_do_daa_ext():

	// ...

	if (master->shutting_down) {
		ret = -ENODEV;
	} else {
		if (rstdaa)
			rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
		ret = master->ops->do_daa(master);
	}

	// ...

which is what fixed the communication with the I3C devices I used in my testing, 
in resume case.

If I remove the i3c_master_do_daa_ext() call from renesas_i3c_resume() then the 
I3C devices are not working anymore after resume on my setup.

Also, the i3c_master_do_daa_ext() call in i3c_hci_resume_common() remains 
unchanged [2] in series [1].

So, could you please let me know if I misunderstood your comment and if there is 
anything that should be done for this patch?

[1] https://lore.kernel.org/all/20260512121732.406009-7-adrian.hunter@intel.com/
[2] 
https://elixir.bootlin.com/linux/v7.1-rc4/source/drivers/i3c/master/mipi-i3c-hci/core.c#L848

-- 
Thank you,
Claudiu


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
