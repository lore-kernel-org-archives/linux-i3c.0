Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCF4CDB47E
	for <linux-i3c@archiver.kernel.org>; Sun, 15 Oct 2023 22:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ak60cWH+AZE/5gBtrEhhqFB3EpVNHC9dTQG+fGOKOhk=; b=lgrPKkwxsTA1ex
	sLfFzeoQqx2xaoPWlvUPtXxE2LEATwSiq5biOuWjgaCG3nXI6RpCDkP6E2eZYvxsIZsN/GD9apSg8
	Rv0+SPg6b8SQRemUm8r5MUCdaePTXgVlhsnXAWQtkm5pujLtS99wrhKb2J1GnYyKHZik0XLd02krD
	viahrcNa+hUwbrhMsutssU0xXDDcJMVURc7uWW9FlTc25yeJXQ0zhqzc775PwgcIuJKsW1bpu45w2
	gjGAc1q0khAwahDfpZ56bXhY0ohU51E4/OtBhCk5qnQLBtefS657v9oH/t9Z2PRlGY46VwO9PjcTF
	3R0BRqJBrBLbsw6Ck5jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qs9Wd-007mRu-3A;
	Sun, 15 Oct 2023 22:23:56 +0000
Received: from mgamail.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qs9Wa-007mRU-1c
	for linux-i3c@lists.infradead.org;
	Sun, 15 Oct 2023 22:23:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697408632; x=1728944632;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RlZ6Ha0GtuAh5On3/WKCVbxG8SzpTVZ0EjW6jR3fMPI=;
  b=nCOd3yzE6YLlVFmOyAUGM0M7Q/PbZXPiDQcdwQzzpV06Z94eE3wdYujU
   pJ1wEDUGzvrVPOClxOmldUuAk8AeFZV5garWaBiFA4DvcYPN+ZTI+plLQ
   megLeC8XlCDBBTNtWZ80xA4/jJLlrAXsGmxho3NPeMZS5KqShWdC1wsy6
   /NfNhH0LHTafCoYhwT7wu6NaPdINw/l0njoe3MD2DJwU0ekoFdFi1odGQ
   sHgixrBOyEEBZbyRFxiHlvcl0jjffDb2GTOdfawFcPetKr/OEa3euj4CS
   E1lBltJp3sI9VexKkSvborV8kM6KG9yEG5jsCvr6YOmdE1hripJdbAvCy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="364779984"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="364779984"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 15:23:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="846171849"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="846171849"
Received: from linux.intel.com ([10.54.29.200])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 15:23:46 -0700
Received: from zlukwins-pc-neo.igk.intel.com (zlukwins-pc-neo.igk.intel.com [10.237.129.138])
	by linux.intel.com (Postfix) with ESMTP id C7301580D6B;
	Sun, 15 Oct 2023 15:23:45 -0700 (PDT)
From: Zbigniew Lukwinski <zbigniew.lukwinski@linux.intel.com>
To: linux-i3c@lists.infradead.org
Cc: alexandre.belloni@bootlin.com,
	Zbigniew Lukwinski <zbigniew.lukwinski@linux.intel.com>
Subject: [PATCH v1 0/1] Fix for IBI handling order
Date: Mon, 16 Oct 2023 00:23:33 +0200
Message-Id: <20231015222334.1652401-1-zbigniew.lukwinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231015_152352_588964_AE5CDD74 
X-CRM114-Status: GOOD (  10.83  )
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

I would like to introduce here patch to cover IBI handling order broken.

IBI shall be handled in order they appear on the bus. Otherwise could hit
case when order of handling them in device driver will be different. It may
lead to invalid assembling fragmented packets or events order broken.

There are two use cases when this problem can happen.

1. MCTP over I3C (aligned with DMTF specification)
Here problem can happen when target device (CPU) wants to send
MCTP request fragment into a few MCTP packets. In such case flow will look
like (having three MCTP packets):
a. CPU wants to send first MCTP packet
b. BMC gets IBI for the first MCTP packet and task is created to handle
that IBI
d. created task handles IBI and runs read transaction to get MCTP packet
and waits for read transaction completion
e. when read transaction happens, CPU wants to send second MCTP packet
right away
f. BMC gets IBI for the second MCTP packet and task is created to handle
that IBI
h. created task (second one) handles IBI and runs read transaction to get
MCTP packet and waits for read transaction completion
e. when read transaction happens, CPU wants to send third MCTP packet right
away
f. BMC gets IBI for the third MCTP packet and task is created to handle
that IBI

At this point having three IBI task without explicitly configured order of
execution which could result with the second one will go first and second
MCTP packet will reach MCTP recipient first.

2. Debug for I3C (aligned with MIPI specification)
Here problem can happen when target device (CPU) sends multiple IBIs one
after another. This could result with the wrong event order will reach
recipient/consumer.

Added separate workqueue with option WQ_MEM_RECLAIM for each device driver.
This ensures IBI handling order and improves IBI handling performance: IBI
handlers for device B are not blocked by IBI handlers for device A.

Zbigniew Lukwinski (1):
  i3c: master: handle IBIs in order they came

 drivers/i3c/master.c       | 14 +++++++++++++-
 include/linux/i3c/master.h |  4 +++-
 2 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
