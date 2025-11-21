Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CC8CFC294
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Nov 2025 16:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5rPh26yAI8F1pgXvs9dhZe6FCkMrAuJZWm6Ejtju8aE=; b=CVyZK/MqO0/xkO
	fgXJipe2YzGLUQhTCpqHRUR9RlKgas1tJpbHdWdW6GPrr87htfgWSoEaTlNyrKODPacyLT2g/v/Qg
	VuIKpQVZjYraP7SOm8cbzPDAJZKdmXgpA24NvcCTmixXXsR83+iv0Y2wJoHXcR3+gv1kfSgw/SHvT
	klVdHq9F3rGgfJdJGNY11ceb00hWyZ2N/zK3L2HlyIvwfGMLQdnS25gH2zSxSKT/37bJrrz80xyI6
	QA/JWh0cxAenykoM2Cr/q3bDy1NgHZz4ohv9RBnflQFfU0g/AUp9iYsak321iL+7gklLYUjc/Z61V
	IG4Kof+xoU+D0bAz6iNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUO4-00000008l91-40Lr;
	Fri, 21 Nov 2025 16:53:32 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUO2-00000008l8T-4AU7
	for linux-i3c@lists.infradead.org;
	Fri, 21 Nov 2025 16:53:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXxf2QSw4eTOJMn9YUg+Jssp7ur5JkVWwS2TWD8zBlOtzOYg+YKHvgE+8VVJQ3gYBXduquee9k77S9lNj37CXDK99BVAAa6kiG/m0bw4Rh5ALqnbL+QPvdOAC5HW5Wau762O4SMrYtSi83LO2kEbuFSbGb1DVkIcU9pdFpbRK2KDgLJnit6oCItfxS8pG/UpsgLfswnPEs+AIm2BEYEO+fFgqadVHD0mE4xrmORziesRJjfjkb0NxL2aX+09UvDwguCw2R+RAEGs5kz2njgCxqpPA4hUfny2WtW5IW/PVd0/707eNhKOYvW6ZPyVh7PVTFEAqjnsrkyXessdI5PKDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYbQDphhDKMny326wBEv19dpI+3+wENDVrelIfGeWtc=;
 b=e9sUWO0+UJXjvYM4jeEDqtUQ/0fvr9uGuJgxyJb6Kbqf2keCY29YW5EEL0wm1jNmUFGffWwG/ZqFeDcCXA1k8nGJvQsZ0db5qasIv1Zt9BaHlzxVgxNdVz7PVRaniuUXkXq1SYsxEpG0OOZwVNv7lgOhOefxdGsPRChBCs9E3pZT36ni9LPUCG9R0Ju27FnDKC+XhssjujWg7k6EJWNpa7aAG3sXlATw6Z5inkYYH3PmBGC8pzjo4Sa+Kq+uZK+0ItT5v8OYyTMc1kjG8dqdLQLSYx5HxIHk0WrJ7+PugD2NxPC1timu/MAZxEmHaJtFDuG25TmZhPfcZC65RFLsSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYbQDphhDKMny326wBEv19dpI+3+wENDVrelIfGeWtc=;
 b=Yhgn1J2aAfujggUzyeP5xCsZAUIEB8XQP2fKTsSaBfBZtRAWpaG29V45S388+vNb3yosLM0AsgpPpQMsmbGy1PUmFdLmsPH+fbSQne2qI/tyUuuDnBXdhnCO7bSCnf0V9UiEi+KbpJXiN6pqk3ZWEs5PeReJElJs6TXgSYzIpkheNnJF31zEQFCkuUOFDgz1NfLaMZWr76fo1twmo8HHcjZ937E7vYYpdaz5y44wakfVwWpQnr9oKb+xUEETGdbqLeADN3BD8hOIFO5eoGc5n7BmGMObyYJ7SuQV0sipizES2R8FiYmwMPkWjN/o45qg2KQDopGYCnsac+2xaVD+dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS8PR04MB9142.eurprd04.prod.outlook.com (2603:10a6:20b:449::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 16:53:18 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 16:53:18 +0000
Date: Fri, 21 Nov 2025 11:53:12 -0500
From: Frank Li <Frank.li@nxp.com>
To: adrianhoyin.ng@altera.com
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] i3c: add sysfs entry for Device NACK Retry count
Message-ID: <aSCY+EIdl8RpMYSV@lizhi-Precision-Tower-5810>
References: <cover.1763703573.git.adrianhoyin.ng@altera.com>
 <89b235bf116bae9fc573772c4f52cfc3d2d122b8.1763703573.git.adrianhoyin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <89b235bf116bae9fc573772c4f52cfc3d2d122b8.1763703573.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: SA9PR13CA0053.namprd13.prod.outlook.com
 (2603:10b6:806:22::28) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS8PR04MB9142:EE_
X-MS-Office365-Filtering-Correlation-Id: 94ebf99b-8df0-44c0-4810-08de291e7859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|376014|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/fwmROAlB+l5hIHnTnA7jdXHqchGoVp2QmntBCoCcdjbiGSHARG/qmjlwf4G?=
 =?us-ascii?Q?0pWSdBBdtFv2uuy29qjbJ80NmwMVqvHAUwORt5PKU7se7JQmHlMS0LyWj0kA?=
 =?us-ascii?Q?4gax2ZfYEU2ixnsWb8f4W390rhx+PJDzJ69k8WqG8CrmaoCHS7k4no3mgM0S?=
 =?us-ascii?Q?sdgYKJ5UBhLmPMzcZL5Y31ucmFwx2Bf0na2c5lW5fHveJ1EMUptG0kDJW+0x?=
 =?us-ascii?Q?9xCDbpk2u8Zfgq3aWdM3zTFH+Wv4Ye0tHsWYee6o/uzAGPIo/4dCG68wsOya?=
 =?us-ascii?Q?uYR1TeVUByAi5RzUxTj29CFBO8beUD4QrpixAC4d5bs9i/XEEbN9BMgfWom9?=
 =?us-ascii?Q?pByxxczZTdVx9+ylOnbHOoG1WGk9qxpKd/U1zxaeBQxXwl+2YM+G94IK/jNt?=
 =?us-ascii?Q?2ijnu53Aqkkkm5KodnYXjS+oRFvicGzH2IBkPIm3rVqibqWAfZcE0wpG7OVz?=
 =?us-ascii?Q?pji9csBJ60jXCMhch+l30w867pbEXkN4zjzhIDhjm9so8mp1KBn5r9IYZyfa?=
 =?us-ascii?Q?8rzVxzQNUWpVlzVSgosd/aeX0rHf/dL1RC5r8hRaKKCOVdnbtKtsWajQCEiR?=
 =?us-ascii?Q?Q/lW1O2B+Ep0XjOWWMUWOP6Op5rGs3FCpG9azRX9TtSyEYJLAluHXLamnpFH?=
 =?us-ascii?Q?z27sqAaZmjqziwji2RdyzjbVLn5L1fjIltOSG7V3foS8STIdGRouzuJxIqau?=
 =?us-ascii?Q?CoXu+yac6X3C8Tvie4+MN9Y6bkxJlU2rQy6jPKLHB9LVHE1zvAs7UA6ED61m?=
 =?us-ascii?Q?9R/bZRskbunRuxedwwFNhWBnuYxldg7a8tLIa6eeAIncDD3ckSafvcfJ5Tbg?=
 =?us-ascii?Q?xVd02noKR7EzQARgnyQL0E/GQrKkoj+CnUGHOMdt8ZlXeuZc8p5kRHDk+tJZ?=
 =?us-ascii?Q?oQgd41LX32v49KDaxn1lgOxqdXFKfxm7xbAGG1rMV+ICf/a1JiX8Jy9DE5aN?=
 =?us-ascii?Q?vsbmSyI6dAhiwyzsHiN+HBA5wUv4v0NOsoou8fu6TbOH53QCfDf/YvCo5QGE?=
 =?us-ascii?Q?OYRYCVD52d/0GXcReE9+TSTzaRJXv0EJ9yjXHHm6GnUHbRrhIrfNlyAdhD/8?=
 =?us-ascii?Q?OEZlmKoHTA8JPLjNlpfIbMBpOrCxD4glFyUbsHmqm5Dp04g17Kzw2nPlUN+E?=
 =?us-ascii?Q?zZAl+RDOoY3SFjYzMRULvWhxUfdwfmMdoArjFRTQLjt/IhtQO7vCZ0G2NjlE?=
 =?us-ascii?Q?kM7ue9LBsq72AMwJFOiojIGyuKmbL4K/ymN4ZEwTct8MwdPpWpMdHKH8SWxp?=
 =?us-ascii?Q?lesleSOPF/s74hlUmLd0Bm+Rg5YsYuetdhhq4Jo+oTzjojGQ0fb1D7y9NHiE?=
 =?us-ascii?Q?RR4oi5YEOLWtGhIpIL2cvdDmOJkdpRm4Zfy0upih8+b0tt+9FeyXj1lcJMnl?=
 =?us-ascii?Q?tlU984DmgRhZrn3tfYi0KrFd4LSkYZBQKC459ULdJmfYcx8WGR5GSu2VvJIW?=
 =?us-ascii?Q?+qzfYl0TlAe616wO+jszNxKI5iOYr8GoH3/+tsb0UmSaY0lOhTtnoKD+ayWX?=
 =?us-ascii?Q?1QtyBr6xwnVERh2I1tsiaAZCOB0ccXQs5uef?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0fKA0NqnUcpKC4jiNOu97/GyLIE5HiNJ0Crh2TzzAVLFzWGwRJCTqD+tmb1Y?=
 =?us-ascii?Q?ulzrqBcYdj7S75AQsJRbhIVldCs2358p2zQ4BLie7lOYYYme8N1s0HsGI+LQ?=
 =?us-ascii?Q?1uhqyw1wpZgn/DKPqX3WGk69z/1UrxB+lrgCLQVixVsjOu0zCLnq7ddKWnYQ?=
 =?us-ascii?Q?wGrx0KyJ778Z3nlktfXLsZ2vOKuwfY8IdjaafvG6yXo6o9Fv8DfBTZSfoQSQ?=
 =?us-ascii?Q?xSSPtrjjsGggZqzJvpkKtJz1tJ9uX2bjGfxvl5T8dvTsYO1XOeY44chgLpUZ?=
 =?us-ascii?Q?4Ac6vfqgCiPyJjOovXI0rAQ6r60XBfA53NAxN7W5u7fa5EMFSFPYkLZ7xSHM?=
 =?us-ascii?Q?6tn8v/Uso0y+bJKHhzcoIOwlU9IqoYwDTZ2mKFdxhTJw0B/9xQNnDJD4jZvE?=
 =?us-ascii?Q?ZNmTYQPHTfAksmI3H5/O18U1x+GCpSwN96YAVWS1GBD/XTvc22ZmLbvGDzVL?=
 =?us-ascii?Q?wjrMcZSw+EUCcwh7qxmSJ458gxG9IRomaf2uDGllEp4f1+zPifduVkFu1mhB?=
 =?us-ascii?Q?BZIvCUEwPDJ6TIAnhJQHZ/hSjU4Ip9XUcM6/f64W0QEFaUyGLGA53F+WXuvB?=
 =?us-ascii?Q?mBV0Qg/35AxebX7LcHeqVhdm0uBOHfueCAjogh4hPPRQhNw7gb8+kgY8UgUT?=
 =?us-ascii?Q?ReeKhM+DFYGXLadF/wlWpe75goRJkGIbKDv707Pzsv+7VDxFHFsnD6L/guLF?=
 =?us-ascii?Q?jDHs1WkWScr6WyUNexpbb7Az75BfjyQPg4xM/Ja2qHp5M0iJuaTB0vKmBlA2?=
 =?us-ascii?Q?Sp37z3M6Fz3fyuwionLt0S1EfPEhNPzGDfrB/8/eX5ACJGgGgDq08ydoHPad?=
 =?us-ascii?Q?OWtwyF1oDGAFLdTfcJzppKrXvi3Of9iuyz2aVT1Er0B2NiD0u8D70+0dZ+A4?=
 =?us-ascii?Q?wiQCTkeXtPzXtnr5JGskrYZQPRLdlO4Yzhut0nDwHYW3UKyIIzqMKumLMIgB?=
 =?us-ascii?Q?71DBZrEETRJArZ2UC2rgB1wQf9lqTIO3wlAix4A6zy2qyPf1qn4ZnutmUJ3U?=
 =?us-ascii?Q?oaVC6CCc7VAbogiWMjcA9dRr2Q7sjZTQWocaloI2Sq8XwuwFMKQ1J148OKGH?=
 =?us-ascii?Q?3YB2XXcVAUmGoSK+I9PaK3FTe4XyoBp7T8Urskt134rumBzmXdmVDgqNWXxT?=
 =?us-ascii?Q?sD6w6nhaKIXw3VXtzSX86uwGk/tXgdT6Jhkqoj1FIGptYA/zlCQiB876m17u?=
 =?us-ascii?Q?WH1K0J90f24EzPCIaEBwKxzoXgsRprduWDS+Vw/Mdz+yPnyrurZTRdTav+wU?=
 =?us-ascii?Q?hh4nKRuUx3D8te5YuOHE5QUM3t309h5v+p+PBPfuTQWs9imfL4pUiiRWeUHi?=
 =?us-ascii?Q?xx2Y9zyGhqOPHq5BOgTmIz3nnZmYd7um7o7rbIWJnndDueYijT7aCvpyUlG1?=
 =?us-ascii?Q?v5pWVPIvFY+UtstCgCLpVcSIC7gStVei2VZg7DSu0bA6kYFmA0RSbIBdNgPz?=
 =?us-ascii?Q?ps9CLdlZ7gOydpwbdEfpkqthKUp3pjvSGHNF1awmbDuCFX+tiH6Mn0cRKtpU?=
 =?us-ascii?Q?5EuT5JiY8y7N5Cc8P9Ld1qWf/G1o0mbIR9lCcN/ROMh6Gk/ALwL89urtd0Il?=
 =?us-ascii?Q?W17+AZZKF57NQ/+8Ot6QnLecNibzrmoCFLPyOGlJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ebf99b-8df0-44c0-4810-08de291e7859
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 16:53:17.9943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pls5w9qK4h7ugN7OkFXLiScJhawEWdVnJjQT+FsiRopEhSFIc9LYyoEo0I+CpEn410gMEtSd+EbSZ3d6hrLYiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_085331_081131_697AB04D 
X-CRM114-Status: GOOD (  16.26  )
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

On Fri, Nov 21, 2025 at 02:21:48PM +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
>
> Document sysfs attribute dev_nack_retry_cnt that controls the number of
> automatic retries performed by the DesignWare I3C controller when a target
> device returns a NACK

Maybe other controller also support this feature, remove 'DesignWare'.

Add

Exist only when I3C constroller support this feature.

Frank
>
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> ---
>  Documentation/ABI/testing/sysfs-bus-i3c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-i3c b/Documentation/ABI/testing/sysfs-bus-i3c
> index c812ab180ff4..d75339330067 100644
> --- a/Documentation/ABI/testing/sysfs-bus-i3c
> +++ b/Documentation/ABI/testing/sysfs-bus-i3c
> @@ -161,3 +161,14 @@ Contact:	linux-i3c@vger.kernel.org
>  Description:
>  		These directories are just symbolic links to
>  		/sys/bus/i3c/devices/i3c-<bus-id>/<bus-id>-<device-pid>.
> +
> +What:		/sys/bus/i3c/devices/i3c-<bus-id>/<bus-id>-<device-pid>/dev_nack_retry_count
> +KernelVersion:  6.18
> +Contact:	linux-i3c@vger.kernel.org
> +Description:
> +		Expose the dev_nak_retry_count which controls the number of automatic
> +		retries that will be performed by the controller when the target device
> +		returns a NACK response. A value of 0 disables the automatic retries. A
> +		max value of 3 can be configured.
> +
> +		Valid values: 0-3
> --
> 2.49.GIT
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
