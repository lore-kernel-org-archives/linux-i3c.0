Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B603606A323
	for <linux-i3c@archiver.kernel.org>; Fri, 13 Nov 2026 18:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L59G0IUh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CcXxNjL/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=b9036l+UWxg5wkvojMa8s//JF1ieHzBSfaSHg+v2Vr0=; b=L59G0IUhL61V2SoVL8tFo+fm5w
	dLlR1tSbxg7ftqat8hP1EZVp5I7Zncq/q9b40FNFlJcRJ7aHi9biUEMRg5GbG3j78OayqhV89VDmZ
	6kQnqt3kE4E7VbtfBlwjQ5/LkwG0pQs6+e0RNE+KwSI0Fr78YMfZ6t2//tDWksRiPhmx8O48ajSD5
	vQpSfRjG/V45Sv45Qaw0yF1jUf3/NaKkYgWb6sBxdNSqLf964aw9W97y74uqpx4y1O+xX0cIbl30g
	xpdV5i8+IyeIuoeoKwyJ8UI9esqPtWAWLlQ86AJCaItnLEGTKsVhg/aXWdaYc6Or5D3+FoIyB0J6B
	E8Il7EQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvkU-0000000Dq0q-07Tg;
	Fri, 13 Nov 2026 18:11:42 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvkQ-0000000Dpzw-0I6t
	for linux-i3c@lists.infradead.org;
	Fri, 13 Nov 2026 18:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794593498; x=1826129498;
  h=message-id:date:mime-version:to:cc:from:subject:
   content-transfer-encoding;
  bh=NftcWOEpz10X8zhDp8eC7MrcWLds1DFCIFWv9A2egaA=;
  b=CcXxNjL/DM3OJOjZq1KLJuLileubFlD49AsRDj/peTsN8Tq08MGXU01I
   MLITvX6yEgbuwVk0T5ZzbsPwk5dUDNTeWCHKxFVKNhWoTpDbJKiQKRjwl
   NjCSB4mbBMkVZ1mDxJG+Miq3UqjshoeBgxjDofQ2JAEZeEvsbpdm2ZEvA
   QaH/ikOLL1kQAxkqMhq4E7jBSL119BVgedhnwO+u/N/OQM7pKFFdTVfw+
   gENjmt0xxkAR9t9FOOQOZX0oU0i84M4cAkWKIobM8vXbHc3hBcf03iFzh
   Cw9JUMXXU2IvQ2qG1JzJ8JW7//KQZSzq317D1MmcM+yRknRmjLtiSrzvF
   w==;
X-CSE-ConnectionGUID: ZomL3LzXQdeFAx05sYEIyA==
X-CSE-MsgGUID: +pCOwtQTTvq+pLCb/AdChw==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3506731"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3506731"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 10:11:36 -0800
X-CSE-ConnectionGUID: cSPMYPTtTzm15KNToOEvng==
X-CSE-MsgGUID: SdaP1JczTBCpdyIaf+00CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="10886912"
Received: from soc-pf3zy3k3.clients.intel.com (HELO [10.80.113.125]) ([10.80.113.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 10:11:36 -0800
Message-ID: <298e818d-90b5-4231-bbc6-ef840c0691ca@linux.intel.com>
Date: Fri, 13 Nov 2026 10:11:36 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: samagazaryan@google.com
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
 meaganlloyd@linux.microsoft.com, linux-i3c@lists.infradead.org
From: "Pathak, Asutosh" <asutosh.pathak@linux.intel.com>
Subject: Re: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101138_900747_84756DC3 
X-CRM114-Status: UNSURE (   7.99  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sam,

Alexandre pointed me at this series. I'm working on a driver for the USB-I3C
device class (USB class 0x3C) - a USB device that acts as an I3C controller,
with a host-side tool (OpenIPC) that drives the bus from userspace. The master
part registers normally, so its targets would show up as i3cdev nodes and we'd
rather use I3C_IOC_XFER than carry our own ioctls. So +1 on the direction.

A few things we need that the current UAPI doesn't cover yet - wanted to raise
them now rather than after it lands:

1. IBIs to userspace. Our main use case is reacting to target interrupts, but
   i3cdev is transfer-only today. We'd need a way to get IBIs (and ideally
   hot-join) delivered to the fd - poll()/read() of an event, or similar.
   This is the big one for us.

2. Larger transfers. len/actual_len are u16 and I3C_IOC_XFER caps the count.
   Our bulk flows go past 64K, so we'd want either a larger width or a
   documented way to split without dropping the bus lock mid-sequence.

3. Explicit opt-in over auto-attach. For bring-up/validation we don't want a
   node appearing just because a driver got unbound - Meagan's driver_override
   approach fits us better, and it also answers Andy's HW-damage concern.

4. CCCs from userspace. The union { rnw; cmd; } looks like it's meant for this -
   just confirming direct/broadcast CCCs are in scope, since our tooling needs
   them.

Happy to help with (1) if you want - it's the piece we care about most and I
suspect the recovery/BMC folks could use it too. Not trying to expand the scope
of v5, just flagging so the ABI leaves room.

Thanks,
Asutosh

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
